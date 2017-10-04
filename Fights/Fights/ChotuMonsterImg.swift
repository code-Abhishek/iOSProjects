//
//  ChotuMonsterImg.swift
//  Fights
//
//  Created by AV on 10/09/16.
//  Copyright © 2016 AV. All rights reserved.
//

import UIKit

class ChotuMonsterImg: UIImageView {
    
    var timer: NSTimer!
    var isDead: Bool!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var imgArray2 = [UIImage]()
    
    func playChotuIdleAnimation() {
        self.image = UIImage(named: "chotuIdle1.png")
        self.animationImages = nil
        imgArray2.removeAll()
        
        for x in 1...4{
            let img2 = UIImage(named: "chotuIdle\(x).png")
            imgArray2.append(img2!)
        }
        
        self.animationImages = imgArray2
        self.animationDuration = 0.6
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playChotuBack4mDeadAnimation() {
        
        if self.isDead  == false{
            self.image = UIImage(named: "chotuIdle1.png")
            self.animationImages = nil
            imgArray2.removeAll()
            
            for x in 1...5 {
                let img = UIImage(named:"chotuDead\(6-x).png")
                imgArray2.append(img!)
            }
            imgArray2.append(UIImage(named: "chotuIdle1.png")!)
            
            self.animationImages = imgArray2
            self.animationDuration = 2.0
            self.animationRepeatCount = 1
            self.startAnimating()
        }
    }
    
    
    func playChotuDeadAnimation() {
        if self.isDead == true{
            self.image = UIImage(named: "chotuDead5.png")
            self.animationImages = nil
            imgArray2.removeAll()
            
            //if we put a value in the closed range opertaor say(1...\(here)) it is included.
            for x in 1...5 {
                let img = UIImage(named:"chotuDead\(x).png")
                imgArray2.append(img!)
            }
            
            self.animationImages = imgArray2
            self.animationDuration = 0.8
            self.animationRepeatCount = 1
            self.startAnimating()
        }
    }

    
}
