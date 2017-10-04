//
//  ViewController.swift
//  userdefault-test
//
//  Created by AV on 09/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLbl: UILabel!
    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") as? String {
            mainLbl.text = "Favourite color: \(color)"
        } else {
            mainLbl.text = " Pick your favourite color."
        }
    
        let person1 = Person(first: "Wing", last:"Chun")
        let person2 = Person(first: "Chun", last: "Lee")
        let person3 = Person(first: "Lee", last: "Cooper")
        
        people.append(person1)
        people.append(person2)
        people.append(person3)
        
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "people")
        
    }


    @IBAction func peach(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setValue("peach", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()

    }
    
    @IBAction func turqoise(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setValue("turqoiuse", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        if let loadedPeople = NSUserDefaults.standardUserDefaults().valueForKey("people") as? NSData {
            
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedPeople) as? [Person] {
                
                for person in peopleArray {
                    print(person.firstname)
                }
            }
        }
    }
    
    @IBAction func voilet(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setValue("voilet", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
}

