//
//  Movies+CoreDataProperties.swift
//  Movie-Box
//
//  Created by Abhishek on 11/07/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movies {

    @NSManaged var title: String?
    @NSManaged var plot: String?
    @NSManaged var url: String?
    @NSManaged var reason: String?
    @NSManaged var image: NSData?

}
