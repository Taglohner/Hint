//
//  AppDelegate.swift
//  Hint
//
//  Created by Steven Taglohner on 04/11/2017.
//  Copyright © 2017 Steven Taglohner. All rights reserved.
//

import UIKit
@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    static let stack = CoreDataStack(modelName: "HintCoredDataModel")!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        /* print SQL directory */
        AppDelegate.stack.applicationDocumentsDirectory()
        
        return true
    }
}

