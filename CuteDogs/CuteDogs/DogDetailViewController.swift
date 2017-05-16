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

        dogNameTextField.text = dog?.name
        if let maxVolume = dog?.maxBarkVolume {
            maxBarkVolumeTextField.text = "\(maxVolume)"
        }
    }

    @IBAction func handleSaveButtonTapped(_ sender: Any) {
    }

}
