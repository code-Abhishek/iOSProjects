//
//  ViewController.swift
//  customTableView-test
//
//  Created by AV on 08/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var places = ["http://www.wonderslist.com/wp-content/uploads/2013/01/Whitehaven-Beach_Australia.jpg","http://www.wonderslist.com/wp-content/uploads/2013/01/pool-the-westin-maui-resort-spa.jpg","http://www.wonderslist.com/wp-content/uploads/2013/01/The-Fairy-Pools-on-the-Isle-of-Skye-Scotland.jpg","http://www.youramazingplaces.com/wp-content/uploads/2013/03/amazing-places-santorini-1.jpg","http://www.youramazingplaces.com/wp-content/uploads/2013/03/Chang-Jiang-river-Hubei-China.-620x330.jpg"]
    
    var texts = ["Whitehaven Beach, Australia", "Westin Maui Resort Spa", "Fairy Pools, Scotland", "Santorini, Europe", "Hubei, China"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PlacesCell") as? PlacesCell {
            
            var img: UIImage!
            
            let url = NSURL(string: places[indexPath.row])!
            if let data = NSData(contentsOfURL: url) {
                img = UIImage(data: data)
            } else {
                img = UIImage(named: "Mumbai")
            }
            
            cell.configureCell(img, txt: texts[indexPath.row])
            
            return cell
        } else {
            return PlacesCell()
        }
    }


}
