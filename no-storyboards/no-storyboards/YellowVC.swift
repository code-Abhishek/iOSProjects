//
//  ViewController.swift
//  no-storyboards
//
//  Created by AV on 06/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import UIKit

class YellowVC: UIViewController {

    var blueVC : BlueVC!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func gotoBlue(sender: AnyObject!){
        blueVC = BlueVC(str: "We are from YellowCube!")
        self.presentViewController(blueVC, animated: true, completion: nil)
        
    }


}

