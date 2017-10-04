//
//  Recipe.swift
//  recipez-CoreData-tests
//
//  Created by AV on 25/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(Recipe)
class Recipe: NSManagedObject {
    
    func setRecipeImage(image:UIImage!) {
        let data = UIImagePNGRepresentation(image)
        self.image = data
    }
    
    func getRecipeImage() -> UIImage {
        let image = UIImage(data: self.image!)!
        return image
    }
    
}
