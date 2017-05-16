//
//  Dog.swift
//  CuteDogs
//
//  Created by adam smith on 5/15/17.
//  Copyright © 2017 adamontherun. All rights reserved.
//

import UIKit
import CoreData

final class Dog: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var maxBarkVolume: Int
}
