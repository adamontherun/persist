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
    
    @IBOutlet weak var dogNameTextField: UITextField!
    
    @IBAction func handleCreateDogButtonTap(_ sender: Any) {
        guard let name = dogNameTextField.text else { return }
        createAndSaveDog(with: name)
    }
    
    private func createAndSaveDog(with name: String) {
        
        guard let dog = NSEntityDescription.insertNewObject(forEntityName: "Dog", into: managedObjectContext) as? Dog else {
            fatalError()
        }
        dog.name = name
        try! managedObjectContext.save()
        dogNameTextField.text = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFromAddDogsToViewDogs" {
            guard let dogsTableViewController = segue.destination as? DogsTableViewController else { fatalError() }
            dogsTableViewController.managedObjectContext = managedObjectContext
        }
    }
}
