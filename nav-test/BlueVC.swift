//
//  BlueVC.swift
//  nav-test
//
//  Created by AV on 09/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import UIKit

class BlueVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func popToRoot(sender: AnyObject!) {
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
