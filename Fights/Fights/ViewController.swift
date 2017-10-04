//
//  ViewController.swift
//  Fights
//
//  Created by AV on 10/09/16.
//  Copyright © 2016 AV. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //NOTE: Always first rename the pics before using them in storyBoard.
    @IBOutlet weak var heartImg: DragImg!
    @IBOutlet weak var foodImg: DragImg!
    @IBOutlet weak var seeImg: DragImg!
    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var chotumonsterImg: ChotuMonsterImg!
    @IBOutlet weak var penalty1Img: UIImageView!
    @IBOutlet weak var penalty2Img: UIImageView!
    @IBOutlet weak var penalty3Img: UIImageView!
    @IBOutlet weak var skullPanelImg: UIImageView!
    @IBOutlet weak var baduPetBtn: UIButton!
    @IBOutlet weak var chotuPetBtn: UIButton!
    @IBOutlet weak var replayBtn: UIButton!
    @IBOutlet weak var groundImg: UIImageView!
    
    let DIM_ALPHA: CGFloat = 0.4
    let OPAQUE: CGFloat = 1.0
    let MAX_PENALTIES  = 3
    
    var penalties = 0
    var timer: NSTimer!
    var timer1: NSTimer!
    var petHappy = false
    var pet: Int!
    var currentItem: UInt32 = 0
    var sfxCaveMusic: AVAudioPlayer!
    var sfxBite: AVAudioPlayer!
    var sfxHeart: AVAudioPlayer!
    var sfxSkull: AVAudioPlayer!
    var sfxDeath: AVAudioPlayer!
    var sfxSee: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        byDefault()
        
        do{
            try sfxCaveMusic = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("sfxCave", ofType: "mp3")!))
            try sfxBite = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("sfxBite", ofType: "wav")!))
            try sfxHeart = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("sfxHeart", ofType: "wav")!))
            try sfxSee = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("sfxSee", ofType: "mp3")!))
            try sfxSkull = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("sfxSkull", ofType: "wav")!))
            try sfxDeath = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("sfxDeath", ofType: "wav")!))
        }catch let err as NSError {
            print(err.debugDescription)
            print("Kaay tar gadbad zaali aahey")
        }
    
        sfxCaveMusic.prepareToPlay()
        sfxCaveMusic.play()
        sfxBite.prepareToPlay()
        sfxHeart.prepareToPlay()
        sfxSee.prepareToPlay()
        sfxSkull.prepareToPlay()
        sfxDeath.prepareToPlay()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnCharacter:", name: "onTargetDropped", object: nil)
    
    }
    
    //this function is important in changing the shape and size of the view
    func setCharacterInCenter() {
        
        let cenh = chotumonsterImg.frame.size.height
        let cenw = chotumonsterImg.frame.size.width
        let cenx = monsterImg.frame.origin.x + 100
        let ceny = monsterImg.frame.origin.y + 150
        
        //used for resolving conflicting constraints with view ka new dimensions and hence avoiding the new userbasedProgramatically created sub-view to have autolayout constraints
        self.chotumonsterImg.translatesAutoresizingMaskIntoConstraints = true
        
        if UIDeviceOrientationIsPortrait(UIDevice.currentDevice().orientation){
            self.groundImg.translatesAutoresizingMaskIntoConstraints = true
        }
        UIView.animateWithDuration(1.0, animations: {
            self.chotumonsterImg.frame = CGRectMake(cenx, ceny, cenh, cenw)
        })

    }
    
    
    @IBAction func petChoose(pet: AnyObject) {
        self.pet = pet.tag
        heartImg.hidden = false
        foodImg.hidden = false
        seeImg.hidden = false
        penalty1Img.hidden = false
        penalty2Img.hidden = false
        penalty3Img.hidden = false
        skullPanelImg.hidden = false
        baduPetBtn.hidden = true
        baduPetBtn.userInteractionEnabled = false
        chotuPetBtn.hidden = true
        chotuPetBtn.userInteractionEnabled = false
        if pet.tag == 2{
            monsterImg.playIdleAnimation()
            chotumonsterImg.hidden = true
            heartImg.dropTarget = monsterImg
            foodImg.dropTarget = monsterImg
            seeImg.dropTarget = monsterImg
            print("Hello badu")
        }else{
            chotumonsterImg.playChotuIdleAnimation()
            monsterImg.hidden = true
            setCharacterInCenter()
            heartImg.dropTarget = chotumonsterImg
            foodImg.dropTarget = chotumonsterImg
            seeImg.dropTarget = chotumonsterImg
            print("Hello chotu")
        }
        startTimer()
        
    }
    
    func itemDroppedOnCharacter(notif: AnyObject) {
        
        //need to add a code for disabling user's item carried but not given to the monster
        petHappy = true
        startTimer()
        if currentItem == 0{
            sfxHeart.play()
        }else if currentItem == 1{
            sfxBite.play()
        }else{
            sfxSee.play()
        }
        foodImg.alpha = DIM_ALPHA
        foodImg.userInteractionEnabled = false
        heartImg.alpha = DIM_ALPHA
        heartImg.userInteractionEnabled = false
        seeImg.alpha = DIM_ALPHA
        seeImg.userInteractionEnabled = false
        print("Package has been Dropped")
    }
    
    func startTimer() {
        if timer != nil{
            timer.invalidate()
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "changeGameState", userInfo: nil, repeats: true)
    }

    func changeGameState() {
        if !petHappy{
            penalties++
            if penalties == 1{
                penalty1Img.alpha = OPAQUE
                penalty2Img.alpha = DIM_ALPHA
                sfxSkull.play()
            }else if penalties == 2{
                penalty2Img.alpha = OPAQUE
                penalty3Img.alpha = DIM_ALPHA
                sfxSkull.play()
            }else if penalties >= 3{
                penalty3Img.alpha = OPAQUE
                sfxSkull.play()
            }else{
                penalty1Img.alpha = DIM_ALPHA
                penalty2Img.alpha = DIM_ALPHA
                penalty3Img.alpha = DIM_ALPHA
            }
        }
            
        let rand = arc4random_uniform(3)
        if rand == 0{
            heartImg.alpha = OPAQUE
            heartImg.userInteractionEnabled = true
            foodImg.alpha = DIM_ALPHA
            foodImg.userInteractionEnabled = false
            seeImg.alpha = DIM_ALPHA
            seeImg.userInteractionEnabled = false
        }else if rand == 1{
            foodImg.alpha = OPAQUE
            foodImg.userInteractionEnabled = true
            heartImg.alpha = DIM_ALPHA
            heartImg.userInteractionEnabled = false
            seeImg.alpha = DIM_ALPHA
            seeImg.userInteractionEnabled = false
        }else{
            seeImg.alpha = OPAQUE
            seeImg.userInteractionEnabled = true
            heartImg.alpha = DIM_ALPHA
            heartImg.userInteractionEnabled = false
            foodImg.alpha = DIM_ALPHA
            foodImg.userInteractionEnabled = false
        }
        
        currentItem = rand
        petHappy = false
        
        if penalties >= MAX_PENALTIES {
                gameOver()
        }
    }

    func gameOver() {
        timer.invalidate()
        heartImg.hidden = true
        foodImg.hidden = true
        seeImg.hidden = true
        if pet == 2{
            monsterImg.isDead = true
            monsterImg.playDeadAnimation()
        }else{
            chotumonsterImg.isDead  = true
            chotumonsterImg.playChotuDeadAnimation()
        }
        sfxCaveMusic.stop()
        sfxDeath.play()
        replayBtn.hidden = false
    }
    
    @IBAction func replayGame(sender: AnyObject) {
        sfxCaveMusic.play()
        replayBtn.hidden = true
        heartImg.hidden = false
        foodImg.hidden = false
        seeImg.hidden = false
        penalties = 0
        currentItem = 0
        petHappy = false
        byDefault()
        if pet == 2{
            monsterImg.hidden = false
            monsterImg.isDead = false
            monsterImg.playBack4mDeadAnimation()
            timer1 = NSTimer.scheduledTimerWithTimeInterval(1.2, target: monsterImg.self, selector: "playIdleAnimation", userInfo: nil, repeats:false)
        }else{
            chotumonsterImg.hidden = false
            chotumonsterImg.isDead = false
            chotumonsterImg.playChotuBack4mDeadAnimation()
            timer1 = NSTimer.scheduledTimerWithTimeInterval(1.2, target: chotumonsterImg.self, selector: "playChotuIdleAnimation", userInfo: nil, repeats:false)
        }
    }
    
    func byDefault() {
        penalty1Img.alpha = DIM_ALPHA
        penalty2Img.alpha = DIM_ALPHA
        penalty3Img.alpha = DIM_ALPHA
    }
    
}
