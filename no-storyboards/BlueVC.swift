//
//  BlueVC.swift
//  no-storyboards
//
//  Created by AV on 06/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import UIKit

class BlueVC: UIViewController {
    
    var yellowVC: YellowVC!
    var redVC: RedVC!
    @IBOutlet weak var mainLbl: UILabel!
    var lblTxt = ""
    
    convenience init(str: String!) {
        self.init(nibName: "BlueVC", bundle: nil)
        lblTxt = str
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        mainLbl.text = lblTxt
    }
    
    @IBAction func gotoRed(sender: AnyObject!) {
        redVC = RedVC(str: "BlueCuboid's underband !")
        self.presentViewController(redVC, animated: true, completion: nil)
    }
    
    @IBAction func backtoYellow(sender: AnyObject!) {
        yellowVC = YellowVC(nibName: "YellowVC", bundle: nil)
           self.presentViewController(yellowVC, animated: true, completion: nil)
    }

}
