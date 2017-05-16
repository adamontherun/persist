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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest = NSFetchRequest<Dog>(entityName: "Dog")
        dogs = try! managedObjectContext.fetch(fetchRequest)
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
}
