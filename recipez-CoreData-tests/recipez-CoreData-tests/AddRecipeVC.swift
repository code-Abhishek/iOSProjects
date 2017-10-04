//
//  AddRecipeVC.swift
//  recipez-CoreData-tests
//
//  Created by AV on 25/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import UIKit
import CoreData
class AddRecipeVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var recipeName: UITextField!
    @IBOutlet weak var recipeIngredients: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImg: UIImageView!
    
    var imgPicker =  UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeImg.layer.cornerRadius = 7.0
        recipeImg.clipsToBounds = true
        imgPicker.delegate = self
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        recipeImg.image = image
    }
    
    @IBAction func addImgBtnPressed(sender: AnyObject) {
        presentViewController(imgPicker, animated: true, completion: nil)
    }


    @IBAction func createRecipe(sender: AnyObject) {
        if let name = recipeName.text where name != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
            recipe.name = name
            recipe.ingredients = recipeIngredients.text
            recipe.steps = recipeSteps.text
            recipe.setRecipeImage(recipeImg.image)
            
            context.insertObject(recipe)
            do
            {
                try context.save()
                print("saved")
            }catch let err as NSError {
                print("SORRY, we are facing some problem with the server.")
                print(err.debugDescription)
            }
            self.navigationController?.popViewControllerAnimated(true)
        }
        
    }
    
}
