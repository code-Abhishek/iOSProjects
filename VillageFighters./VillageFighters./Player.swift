//
//  Player.swift
//  VillageFighters.
//
//  Created by AV on 12/07/16.
//  Copyright © 2016 AV. All rights reserved.
//

import Foundation

class Player {
    
    private var _hp = 100
    private var _attackPwr = 20
    private var _name = "Juno"
    private var _inventory : [String] = []
    
    var name : String {
        return _name
    }
    
    var hp : Int {
            return _hp
    }
    
    var attackPwr : Int {
        return _attackPwr
    }
    
    var inventory : [String] {
        return _inventory
    }

    var isAlive : Bool {
        if hp <= 0 {
            return false
        }else{
            return true
        }
    }
    
    
    init (name: String , startingHp: Int, attackPwr: Int) {
        self._name = name
        self._hp = startingHp
        self._attackPwr = attackPwr
    }
    
   
    func attemptAttack (attackPwr : Int) -> Int?{
        if self.isAlive{
            self._hp = self._hp - attackPwr
            return hp
        }else {
            return nil
        }
    }
    
    func addItemToInventory(item: String) {
            _inventory.append(item)
    }
    
}