//
//  BlueVC.swift
//  segue-play
//
//  Created by AV on 06/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import UIKit

class BlueVC: UIViewController {

    @IBOutlet weak var mainlbl: UILabel!
    var transferTxt = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        mainlbl.text = transferTxt
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
