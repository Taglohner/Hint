//
//  InputViewController.swift
//  Hint
//
//  Created by Steven Taglohner on 04/11/2017.
//  Copyright © 2017 Steven Taglohner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let APIservice = APIService.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIservice.searchMovie(query: "Batman Begins")
        
    }
    
    
    
    
}

