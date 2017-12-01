
//
//  ResultsViewController.swift
//  Hint
//
//  Created by Steven Taglohner on 16/11/2017.
//  Copyright © 2017 Steven Taglohner. All rights reserved.
//

import UIKit
import CoreData

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    // MARK: - Properties
    
    let coreDataStack = AppDelegate.stack
    @IBOutlet weak var tableView: UITableView!
    var id = Int()
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performFetch()
    }
    
    // MARK: - NSFecthedResultsController
    
    lazy var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "popularity", ascending: true)]
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: coreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        return frc
    }()
    
    // MARK: - TableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        if let sectionsCount = fetchedResultsController.sections?.count {
            return sectionsCount
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rowsCount = fetchedResultsController.sections?[section].numberOfObjects {
            return rowsCount
        } else {
            return 0
        }
    }
    
    // MARK: - TableViewDelegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movie = fetchedResultsController.object(at: indexPath) as? Movie, let title = movie.title, let overview = movie.overview, let releaseDate = movie.releaseDate, let coverImage = movie.coverImage else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.movieTitle.text = title
        cell.movieOverview.text = overview
        cell.movieReleaseDate.text = releaseDate
        cell.movieCover.image = UIImage(data: coverImage)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedMovie = fetchedResultsController.object(at: indexPath) as? Movie {
            id = Int(selectedMovie.id)
            performSegue(withIdentifier: "toSuggestionsViewController", sender: self)
        } else {
            // PRESENT NO RESULTS FOUND SCREEN
        }
    }
    
    // MARK: Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? SuggestionsViewController {
            destinationViewController.id = id
        }
    }

    // MARK: - Fetches
    
    func performFetch(){
        do {
            try fetchedResultsController.performFetch()
        } catch let e as NSError {
            print("Error while trying to perform a search: \n\(e)\n\(String(describing: fetchedResultsController))")
        }
    }
    
    // MARK: - NSFetchedResultsControllerDelegate
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        let set = IndexSet(integer: sectionIndex)
        
        switch (type) {
        case .insert:
            tableView.insertSections(set, with:.fade)
        case .delete:
            tableView.deleteSections(set, with: .fade)
        default:
            break
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type) {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .fade)
        case .move:
            tableView.deleteRows(at: [indexPath!], with: .fade)
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    // MARK: Helpers
    
    func clearData(){
        do {
            let context = coreDataStack.context
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
            do {
                guard let objects = try context.fetch(fetchRequest) as? [NSManagedObject] else {
                    print("Error fetching data to delete.")
                    return
                }
                for object in objects {
                    context.delete(object)
                }
            }
            catch let error {
                print("ERROR DELETING : \(error)")
            }
        }
    }
}
