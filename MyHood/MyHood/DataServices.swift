//
//  DataServices.swift
//  MyHood
//
//  Created by AV on 24/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import Foundation
import UIKit

class DataServices {
    static let instance = DataServices()
    
    private var _loadedPosts = [Post]()  // _loadedPosts is of type Post, so all the archiving and unarchiving of data is done throught that class. So it should conform to NSObject & NSCoding and implement the req. init()'s for background prces.
    
    var loadedPosts: [Post] {
        return _loadedPosts
    }

    func loadPosts() {
        if let postsData = NSUserDefaults.standardUserDefaults().dataForKey("posts") {
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post] {
                _loadedPosts = postsArray
            }
        }
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoaded", object: nil))
    }
    
    func savePosts() {
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: "posts")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func addPost(post: Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    
    }
    
    func saveImageAndCreatePath(image: UIImage) -> String {
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "IMG\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentPathForFilename(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
    }
    
    func imageForPath(path: String) -> UIImage? {
        let fullPath = documentPathForFilename(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func documentPathForFilename(name: String) -> String {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = path[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }
    
}
