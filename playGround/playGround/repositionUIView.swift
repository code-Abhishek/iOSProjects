//
//  repositionUIView.swift
//  playGround
//
//  Created by AV on 08/12/16.
//  Copyright © 2016 AV. All rights reserved.
//

import Foundation


class repositionUIView: ViewController {
    
    //change position of target frame (UIView)
    
    func changePosition (sender: AnyObject) {
        let xpos = chotuImg.frame.origin.x
        let ypos = chotuImg.frame.origin.y
        let height = chotuImg.frame.size.height
        let width = chotuImg.frame.size.width
        UIView.animateWithDuration(time,animations:{
        self.chotuImg.frame = CGRectMake(xpos,ypos,height,width)
    
    })
    }
    
}