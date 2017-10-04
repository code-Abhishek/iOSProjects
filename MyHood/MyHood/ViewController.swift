//
//  ViewController.swift
//  MyHood
//
//  Created by AV on 21/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        DataServices.instance.loadPosts()
       NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "postsLoaded", object: nil)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = DataServices.instance.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            cell.configureCell(post)
            return cell
        } else {
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 75.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServices.instance.loadedPosts.count
    }
    
    func onPostsLoaded(notif: AnyObject) {
        tableView.reloadData()
    }
}

