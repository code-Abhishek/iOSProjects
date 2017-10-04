//
//  ViewController.swift
//  VillageFighters.
//
//  Created by AV on 12/07/16.
//  Copyright © 2016 AV. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var orc: Orc!
    var gaurd: Guard!
    var soldier: Soldier!
    var kimara : Kimara!
    var chestMessage: String?
    
    var atkSound : AVAudioPlayer!
    
    @IBOutlet weak var bg: UIImageView!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var gameBg: UIImageView!
    @IBOutlet weak var kimaraImg: UIImageView!
    @IBOutlet weak var soldierImg: UIImageView!
    @IBOutlet weak var orcImg: UIImageView!
    @IBOutlet weak var guardImg: UIImageView!
    @IBOutlet weak var ground: UIImageView!
    @IBOutlet weak var display: UIImageView!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var player1Hp: UILabel!
    @IBOutlet weak var player2Hp: UILabel!
    @IBOutlet weak var Attack1Lbl: UILabel!
    @IBOutlet weak var Attack2Lbl: UILabel!
    @IBOutlet weak var attackBtnLbl: UIButton!
    @IBOutlet weak var attackBtn2Lbl: UIButton!
    @IBOutlet weak var gameStartLbl: UIImageView!
    @IBOutlet weak var gameStartBtnLbl: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        
        let url = NSURL(fileURLWithPath: path!)
        
        do {
            try atkSound = AVAudioPlayer(contentsOfURL: url)
            atkSound.prepareToPlay()
        }catch let err as NSError {
            print(err.debugDescription)
        }
    
    }
    
    func playSound() {
        if atkSound.playing {
            atkSound.stop()
        }
        atkSound.play()
    }
    
    
    
    @IBAction func gameStartButtonPressed(sender: AnyObject) {
        
        let p1name = textField1.text
        let p2name = textField2.text
        
        bg.hidden = false
        gameLabel.hidden = true
        textField1.hidden = true
        textField2.hidden = true
        gameStartBtnLbl.hidden = true
        gameStartLbl.hidden = true
        gameBg.hidden = false
        Attack1Lbl.hidden = false
        Attack2Lbl.hidden = false
        attackBtnLbl.hidden = false
        attackBtn2Lbl.hidden = false
        ground.hidden = false
        display.hidden = false
        displayLabel.hidden = false
        player1Hp.hidden = false
        player2Hp.hidden = false
        
        genereateRandomPlayer(p1name! , p2name: p2name!)
        
    }
    
    func genereateRandomPlayer(p1name: String, p2name:String) {
        let rand = Int(arc4random_uniform(4))
        switch rand {
            case 0...5 :
                orc = Orc(name: p1name, startingHp: 100, attackPwr: 20)
                soldier  = Soldier(name: p2name, startingHp: 120, attackPwr: 15)
                orcImg.hidden = false
                soldierImg.hidden = false
                player1Hp.text = "\(orc.hp) HP"
                player2Hp.text = "\(soldier.hp) sHP"
                break
        
            default :
                break
        }
    }
    
    @IBAction func player1AttackPressed(sender: AnyObject) {
        
        if orc.isAlive{
            
            playSound()
            if let pts = soldier.attemptAttack(orc.attackPwr) {
                player2Hp.text = "\(soldier.hp) HP"
                displayLabel.text = " Attacked \(soldier.name) for \(pts) HP"
            }else{
                displayLabel.text = " Attack unsuccessful"
            }
        
            if  let stash = soldier.giveUpStash(){
                orc.addItemToInventory(stash)
                displayLabel.text = "\(orc.name) found \(stash)"
            }
            
            if !soldier.isAlive{
                soldierImg.hidden = true
                player2Hp.text = ""
                attackBtn2Lbl.hidden = true
                attackBtnLbl.hidden = true
                Attack2Lbl.text = "Win!"
                Attack1Lbl.text = ""
            }
        }
    }
    
    @IBAction func player2AttackPressed(sender: AnyObject) {
        
        if soldier.isAlive{
            
            playSound()
            if let pts = orc.attemptAttack(soldier.attackPwr) {
                player1Hp.text = "\(orc.hp) HP"
                displayLabel.text = " Attacked \(orc.name) for \(pts) HP"
            }else{
                displayLabel.text = " Attack unsuccessful"
            }
        
            if  let loot = orc.dropLoot(){
                soldier.addItemToInventory(loot)
                displayLabel.text = "\(soldier.name) found \(loot)"
            }
        
            if !orc.isAlive {
                orcImg.hidden = true
                player1Hp.text = ""
                attackBtn2Lbl.hidden = true
                attackBtnLbl.hidden = true
                Attack2Lbl.text = "Win!"
                Attack1Lbl.text = ""
            }
        }
    }
}
