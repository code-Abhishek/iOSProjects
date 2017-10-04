//
//  ViewController.swift
//  Movie-Box
//
//  Created by Abhishek on 11/07/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var movies = [Movies]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
//        //Code to include an image in a titleView of NavigationBar
//        let image = UIImage(named: "MovieBox.png")
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
//        imageView.contentMode = .ScaleAspectFit
//        imageView.image = image
//        navigationItem.titleView = imageView
    
        
    
    }
   
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            let movie = movies[indexPath.row]
            cell.configureCell(movie)
            return cell
        } else {
            return MovieCell()
        }
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as? AppDelegate
        let context = app?.managedObjectContext
        let fetchReq = NSFetchRequest(entityName: "Movies")
        do{
            let results = try context?.executeFetchRequest(fetchReq)
            self.movies = results as! [Movies]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    
    
}

