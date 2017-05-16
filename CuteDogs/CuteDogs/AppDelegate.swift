//
//  AppDelegate.swift
//  CuteDogs
//
//  Created by adam smith on 5/15/17.
//  Copyright © 2017 adamontherun. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        configureInitialViewController()
        return true
    }

    private func configureInitialViewController() {
        let persistentContainer = NSPersistentContainer(name: "CuteDogModel")
        persistentContainer.loadPersistentStores { (_, error) in
            guard error == nil else { fatalError() }
            
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let addDogViewController = storyboard.instantiateViewController(withIdentifier: "AddDogViewController") as? AddDogViewController else { fatalError() }
                addDogViewController.managedObjectContext = persistentContainer.viewContext
                let navigationController = UINavigationController(rootViewController: addDogViewController)
                self.window?.rootViewController = navigationController
            }
        }
    }
}

