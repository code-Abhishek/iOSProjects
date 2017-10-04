//
//  MakePostVCViewController.swift
//  MyHood
//
//  Created by AV on 23/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import UIKit

class MakePostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleTxtField: UITextField!
    @IBOutlet weak var descTxtField: UITextField!
    
    var imgPicker =  UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
        imgPicker.delegate = self
    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPicBtnPressed(sender: AnyObject) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imgPicker, animated: true, completion: nil)
    }
    
    @IBAction func makePostBtnPressed(sender: UIButton) {
        if let title = titleTxtField.text, let desc = descTxtField.text, let img = postImg.image {
            let imagePath = DataServices.instance.saveImageAndCreatePath(img)
            let post = Post(imgPath: imagePath, title: title, description: desc)
            DataServices.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
    }

}
