//
//  Post.swift
//  MyHood
//
//  Created by AV on 21/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    
    private var _imgPath: String!
    private var _title: String!
    private var _desc: String!
    
    var imgPath : String {
        return _imgPath
    }
    
    var title: String {
        return _title
    }
    
    var desc: String {
        return _desc
    }
    
    init(imgPath: String, title: String, description: String) {
        self._title = title
        self._desc = description
        self._imgPath = imgPath
    }

    override init() {
    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imgPath = aDecoder.decodeObjectForKey("imgPath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._desc = aDecoder.decodeObjectForKey("description") as? String
    }
 
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imgPath, forKey: "imgPath")
        aCoder.encodeObject(self._title, forKey: "title")
        aCoder.encodeObject(self._desc, forKey: "description")
    }
}
