//
//  Movies.swift
//  Movie-Box
//
//  Created by Abhishek on 11/07/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(Movies)
class Movies: NSManagedObject {
    
    func setMovieImg(image:UIImage!) {
        let imgData = UIImagePNGRepresentation(image)
        self.image = imgData
    }
    
    func getMovieImg() -> UIImage {
        let image = UIImage(data: self.image!)!
        return image
    }
}
