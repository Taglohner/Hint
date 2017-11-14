//
//  ResultsTableViewController.swift
//  Hint
//
//  Created by Steven Taglohner on 11/11/2017.
//  Copyright © 2017 Steven Taglohner. All rights reserved.
//

import UIKit
import CoreData

class ResultsTableViewController: CoreDataTableViewController {

    //MARK: Properties
    
    let coreDataStack = AppDelegate.stack
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* creates a Fetch Request */
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "releaseDate", ascending: true)]
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: coreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movie = fetchedResultsController?.object(at: indexPath) as? Movie, let title = movie.title, let overview = movie.overview, let releaseDate = movie.releaseDate else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        cell.movieTitle.text = title
        cell.movieOverview.text = overview
        cell.movieReleaseDate.text = releaseDate

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
