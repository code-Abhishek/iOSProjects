//
//  RestaurantAnnotation.swift
//  Mappy
//
//  Created by Abhishek on 16/09/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import Foundation
import MapKit

class RestaurantAnnotation: NSObject, MKAnnotation {
    var coordinate = CLLocationCoordinate2D()
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}


