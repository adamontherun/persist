//
//  AddDogViewController.swift
//  CuteDogs
//
//  Created by adam smith on 5/15/17.
//  Copyright © 2017 adamontherun. All rights reserved.
//

import UIKit
import CoreData

class AddDogViewController: UIViewController {

    var managedObjectContext: NSManagedObjectContext!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFromAddDogsToViewDogs" {
            guard let dogsTableViewController = segue.destination as? DogsTableViewController else { fatalError() }
            dogsTableViewController.managedObjectContext = managedObjectContext
        }
    }
}
