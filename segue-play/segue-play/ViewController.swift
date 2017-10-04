//
//  ViewController.swift
//  segue-play
//
//  Created by AV on 06/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func goBlue(sender: AnyObject) {
        let str = " Hey we just came from the Yellow screen!"
        performSegueWithIdentifier("goToBlue", sender: str)
        
        
    }
    @IBAction func goRed(sender: AnyObject) {
        performSegueWithIdentifier("goToRed", sender: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToBlue" {
            
            if let blueVC = segue.destinationViewController as? BlueVC {
                
                if let theString = sender as? String{
                    blueVC.transferTxt = theString
                }
                
            }
        }
    }
    


}

