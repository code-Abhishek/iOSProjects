//
//  MonsterImg.swift
//  Fights
//
//  Created by AV on 10/09/16.
//  Copyright © 2016 AV. All rights reserved.
//


import UIKit

class MonsterImg: UIImageView {
    var timer: NSTimer!
    var isDead: Bool!
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var imgArray = [UIImage]()
    
    func playIdleAnimation() {

        self.image = UIImage(named: "idle1.png")
        self.animationImages = nil
        imgArray.removeAll()
        
        //if we put a value in the closed range opertaor say(1...\(here)) it is included.
        for x in 1...4 {
            let img = UIImage(named:"idle\(x).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playBack4mDeadAnimation() {
        
        if self.isDead  == false{
            self.image = UIImage(named: "idle1.png")
            self.animationImages = nil
            imgArray.removeAll()
        
            for x in 1...5 {
                let img = UIImage(named:"dead\(6-x).png")
                imgArray.append(img!)
            }
            imgArray.append(UIImage(named: "idle1.png")!)
        
            self.animationImages = imgArray
            self.animationDuration = 2.0
            self.animationRepeatCount = 1
            self.startAnimating()
        }
    }
    
    
    func playDeadAnimation() {
        if self.isDead == true{
            self.image = UIImage(named: "dead5.png")
            self.animationImages = nil
            imgArray.removeAll()
        
            //if we put a value in the closed range opertaor say(1...\(here)) it is included.
            for x in 1...5 {
                let img = UIImage(named:"dead\(x).png")
                imgArray.append(img!)
            }
        
            self.animationImages = imgArray
            self.animationDuration = 0.8
            self.animationRepeatCount = 1
            self.startAnimating()
        }
    }
}