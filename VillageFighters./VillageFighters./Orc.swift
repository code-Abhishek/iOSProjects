//
//  Orc.swift
//  VillageFighters.
//
//  Created by AV on 12/07/16.
//  Copyright © 2016 AV. All rights reserved.
//

import Foundation

class Orc: Player {
    
    var type : String {
        return "Orc Raider."
    }
    
    var loot : [String] {
        return ["Steelwire Club", "Stolen Dragon Shield", "Orcfill Potion", "300 gold coins"]
    }
    
    func dropLoot() -> String? {
        if !self.isAlive{
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        return nil
    }
    
}
