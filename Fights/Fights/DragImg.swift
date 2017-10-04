//
//  DragImg.swift
//  Fights
//
//  Created by AV on 10/09/16.
//  Copyright © 2016 AV. All rights reserved.
//

import UIKit

class DragImg: UIImageView {
    
    var orignalPosition : CGPoint!
    var dropTarget: UIView?
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        orignalPosition = self.center
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first{
            let position = touch.locationInView(self.superview)
            self.center = CGPointMake(position.x, position.y)
        }

    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch=touches.first , let target = dropTarget {
            let position = touch.locationInView(touch.view!.window)  //what does this mean??
        //  let position = touch.locationInView(self.superview)
            if CGRectContainsPoint(target.frame, position){
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "onTargetDropped", object: nil))
            }
        }
        self.center = orignalPosition
    }


}