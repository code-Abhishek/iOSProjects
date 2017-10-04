//
//  Recipe+CoreDataProperties.swift
//  recipez-CoreData-tests
//
//  Created by AV on 25/02/17.
//  Copyright © 2017 AV. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Recipe {

    @NSManaged var image: NSData?
    @NSManaged var ingredients: String?
    @NSManaged var name: String?
    @NSManaged var steps: String?

}
