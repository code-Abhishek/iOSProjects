//
//  Soldier.swift
//  VillageFighters.
//
//  Created by AV on 12/07/16.
//  Copyright © 2016 AV. All rights reserved.
//

import Foundation

class  Soldier : Player {
    
    var type : String {
        return "Soldier at Gate"
    }
    
    var stash : [String] {
        return ["Halfling Shield", "Birchwood Bow & Arrows", " Valerian Steel Sword" , "Key to Palace"]
    }
    
    func giveUpStash() -> String? {
        if !self.isAlive{
            let rand = Int(arc4random_uniform(UInt32(stash.count)))
            return stash[rand]
        }
        return nil
    }
    
}