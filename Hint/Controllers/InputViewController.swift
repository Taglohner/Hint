//
//  InputViewController.swift
//  Hint
//
//  Created by Steven Taglohner on 04/11/2017.
//  Copyright © 2017 Steven Taglohner. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    //MARK: Properties
    
    let APIservice = APIService.sharedInstance()
    @IBOutlet weak var searchStringTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIservice.searchMovie(query: "Soldier")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func suggestMeButton(_ sender: Any) {
        performSegue(withIdentifier: "ToResultsViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToResultsViewController" {
            // PENDING IMPLEMENTATION
        }
    }
    
}

