//
//  RedVC.swift
//  no-storyboards
//
//  Created by AV on 07/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import UIKit

class RedVC: UIViewController {

    var blueVC: BlueVC!
    @IBOutlet weak var redLbl: UILabel!
    var redTxt = ""
    
    convenience init(str: String){
        self.init(nibName: "RedVC", bundle: nil)
        redTxt = str
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
        redLbl.text  =  "This is" + redTxt
    }
    
    @IBAction func backtoBlue(sender: AnyObject!) {
        blueVC = BlueVC(str: "Back from RED--City")
        self.presentViewController(blueVC, animated: true, completion: nil)
    }
    
}
