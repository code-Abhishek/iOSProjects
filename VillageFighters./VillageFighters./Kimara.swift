//
//  Kimara.swift
//  VillageFighters.
//
//  Created by AV on 12/07/16.
//  Copyright © 2016 AV. All rights reserved.
//

import Foundation

class Kimara: Orc{
    
   override var type : String {
        return "Kimara"
    }
    
    var immune_MAX = 15
    
    convenience init(immune: Int, name: String, hp: Int, attackPwr: Int) {
        self.init(name: name, startingHp: hp, attackPwr: attackPwr)
        immune_MAX = immune
    }
    
    override var loot :[String] {
       return ["Crooked Axe", "Magical Boots"]
    }
   
     override func attemptAttack(attackPwr: Int) ->Int? {
        if  attackPwr > immune_MAX {
            return super.attemptAttack(attackPwr)
        }else{
            return nil
        }
    }

}