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
<<<<<<< HEAD

    @IBOutlet weak var searchStringTextField: UITextField!
=======
>>>>>>> f65f3c933e2bac90ced95f180b8833b99ba9084f
    
    let APIservice = APIService.sharedInstance()
    @IBOutlet weak var searchStringTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        

        
        
=======
        APIservice.searchMovie(query: "Soldier")
>>>>>>> f65f3c933e2bac90ced95f180b8833b99ba9084f
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func suggestMeButton(_ sender: Any) {
<<<<<<< HEAD
        
        if let text = searchStringTextField.text {
            APIservice.searchMovie(query: text)
        } else {
            print("container is empty")
        }
        
=======
>>>>>>> f65f3c933e2bac90ced95f180b8833b99ba9084f
        performSegue(withIdentifier: "ToResultsViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToResultsViewController" {
            // PENDING IMPLEMENTATION
        }
    }
    
<<<<<<< HEAD
    
    
=======
>>>>>>> f65f3c933e2bac90ced95f180b8833b99ba9084f
}

