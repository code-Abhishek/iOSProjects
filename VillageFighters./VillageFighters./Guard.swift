//
//  Guard.swift
//  VillageFighters.
//
//  Created by AV on 12/07/16.
//  Copyright © 2016 AV. All rights reserved.
//

import Foundation


class Guard : Soldier {
    
    override var type : String {
        return "Kings Guard"
    }
    
    override var stash : [String] {
        return ["King's Crown", "Golden Amulet", "Poisoned Dagger"]
    }
    
    var immune_MAX = 15
    
    convenience init (immune: Int, name: String, hp: Int, attackPwr: Int){
        self.init (name: name, startingHp : hp, attackPwr: attackPwr)
        self.immune_MAX = immune
    }
    
    override func attemptAttack(attackPwr: Int) -> Int? {
        if attackPwr >= immune_MAX {
           return super.attemptAttack(attackPwr)
        }else{
            return nil
        }
    }
}