//
//  Person.swift
//  userdefault-test
//
//  Created by AV on 09/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding {
    
    var firstname: String!
    var lastname: String!
    
    init(first: String, last: String) {
        firstname = first
        lastname = last
    }
    
    override init() {
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.firstname = aDecoder.decodeObjectForKey("firstname") as? String
        self.lastname = aDecoder.decodeObjectForKey("lastname") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstname, forKey: "firstname")
        aCoder.encodeObject(self.lastname, forKey: "lastname")
    }
    
}
