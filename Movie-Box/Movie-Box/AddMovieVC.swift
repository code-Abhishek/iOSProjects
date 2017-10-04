//
//  AddMovieVC.swift
//  Movie-Box
//
//  Created by Abhishek on 12/07/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var moviePlot: UITextField!
    @IBOutlet weak var movieURL: UITextField!
    @IBOutlet weak var movieReason: UITextField!
    @IBOutlet weak var movieImage: UIImageView!
    
    var imgPickr = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPickr.delegate = self
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imgPickr.dismissViewControllerAnimated(true, completion: nil)
        movieImage.image = image
    }

    @IBAction func saveMovie(sender: AnyObject) {
        if let title = movieTitle.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movies", inManagedObjectContext: context)!
            let movie = Movies(entity: entity, insertIntoManagedObjectContext: context)
            movie.title = title
            movie.plot = moviePlot.text
            movie.url = movieURL.text
            movie.reason = movieReason.text
            movie.setMovieImg(movieImage.image)
            
            context.insertObject(movie)
            do
            {
                try context.save()
                print("saved")
            } catch let err as NSError {
                print("SORRY, we are facing some problem with the server.")
                print(err.debugDescription)
            }
        }
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
