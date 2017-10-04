//
//  ViewController.swift
//  nav-test
//
//  Created by AV on 09/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import UIKit

class YellowVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func popVC (sender: AnyObject!) {
        self.navigationController?.popViewControllerAnimated(true)
    }
   
}
