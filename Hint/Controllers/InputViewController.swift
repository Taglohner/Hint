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
    
    @IBOutlet weak var searchStringTextField: UITextField!
    
    
    let APIservice = APIService.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIservice.searchMovie(query: "Batman Begins")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func suggestMeButton(_ sender: Any) {
        
    }
}

