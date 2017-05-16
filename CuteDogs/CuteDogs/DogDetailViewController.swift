//
//  DogDetailViewController.swift
//  CuteDogs
//
//  Created by adam smith on 5/15/17.
//  Copyright © 2017 adamontherun. All rights reserved.
//

import UIKit
import CoreData

class DogDetailViewController: UIViewController {

    var dog: Dog?
    
    @IBOutlet weak var dogNameTextField: UITextField!
    @IBOutlet weak var maxBarkVolumeTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let dog = dog else { fatalError() }
        dogNameTextField.text = dog.name
        maxBarkVolumeTextField.text = String(dog.maxBarkVolume)
    }

    @IBAction func handleSaveButtonTapped(_ sender: Any) {
        guard
            let dog = dog,
            let updatedName = dogNameTextField.text,
            let updatedMaxBarkVolume = maxBarkVolumeTextField.text,
            let updatedMaxBarkVolumeInt = Int(updatedMaxBarkVolume)
        else {
                return
        }
        dog.name = updatedName
        dog.maxBarkVolume = updatedMaxBarkVolumeInt
        try! dog.managedObjectContext?.save()
        self.navigationController?.popViewController(animated: true)
    }

}
