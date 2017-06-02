//
//  DogsTableViewController.swift
//  CuteDogs
//
//  Created by adam smith on 5/15/17.
//  Copyright © 2017 adamontherun. All rights reserved.
//

import UIKit
import CoreData

class DogsTableViewController: UITableViewController {
    
    var dogs = [Dog]()
    var managedObjectContext: NSManagedObjectContext!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let fetchRequest = NSFetchRequest<Dog>(entityName: "Dog")
        let predicate = NSPredicate(format: "name == %@", "Fido")
        fetchRequest.predicate = predicate
        dogs = try! managedObjectContext.fetch(fetchRequest)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cuteDogCell", for: indexPath)
        let dog = dogs[indexPath.row]
        cell.textLabel?.text = dog.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFromDogsToDogDetail" {
            guard
                let dogDetailViewController = segue.destination as? DogDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow
            else {
                fatalError()
            }
            let dog = dogs[indexPath.row]
            dogDetailViewController.dog = dog
        }
    }
}
