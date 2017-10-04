//
//  ViewController.swift
//  playGround
//
//  Created by AV on 06/12/16.
//  Copyright © 2016 AV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chotuImg: UIImageView!
    var count = 1
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func btnUp(sender: AnyObject) {

        let xPosition = chotuImg.frame.origin.x + 130
        
        //View will slide 20px up
        let yPosition = chotuImg.frame.origin.y + 145
        
        let height = chotuImg.frame.size.height
        let width = chotuImg.frame.size.width
        
        if count == 1 {
        UIView.animateWithDuration(1.0, animations: {
            
            self.chotuImg.frame = CGRectMake(xPosition, yPosition, height ,width)
            
        })
            count = count + 1
        }else{
        UIView.animateWithDuration(1.0, animations: {
            self.chotuImg.frame = CGRectMake(xPosition - 130, yPosition - 130, 50, 50)
        })
        }
    }
}
