//
//  ViewController.swift
//  calcy
//
//  Created by AV on 19/02/16.
//  Copyright © 2016 AV. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum Op : String {
        case Add = "+"
        case Subtract = "-"
        case Multiply = "*"
        case Divide = "/"
        case Empty = ""
    }
    
    @IBOutlet weak var display: UILabel!
    
    var result = ""
    var displayNo  = ""
    var leftVal = ""
    var rightVal = ""
    var btnSound : AVAudioPlayer!
    var currentop = Op.Empty
    var displen = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource( "btn" , ofType: "wav")
        
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do{
            
            try btnSound = AVAudioPlayer(contentsOfURL: soundURL)
        } catch let  err as NSError {
            print(err.debugDescription)
        }
        
        btnSound.prepareToPlay()
    }
    
    @IBAction func buttonPressed(button: AnyObject){
        playSound()
        displen = displayNo.characters.count
        
        if displen > 7 {
            let alertBox = UIAlertController(title: "Only 8 Digit Operations!", message: "We're sorry , we are currently working to get this fixed.", preferredStyle: UIAlertControllerStyle.Alert)
            alertBox.addAction(UIAlertAction(title: "Cool 😇!", style: UIAlertActionStyle.Default, handler: nil))
            alertBox.addAction(UIAlertAction(title: "well", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alertBox, animated: true , completion: nil)
        }else{
            displayNo += ("\(button.tag)")
            display.text = displayNo
        }
    }
    
    
    @IBAction func onClearLongPressed(btn: UILongPressGestureRecognizer) {
        
        if btn.state == .Began {
            leftVal = ""
            rightVal = ""
            displayNo = ""
            display.text = ""
            currentop = Op.Empty
        }
        playSound()
    }
    @IBAction func onClearPressed(btn:AnyObject){
        
        if displayNo != "" {
        let index1 = displayNo.endIndex.advancedBy(-1)
        let substr1 = displayNo.substringToIndex(index1)
        displayNo = substr1
        display.text  = displayNo
        }
        playSound()
    }

    @IBAction func onAddPressed (btn : AnyObject){
        processOperation( Op.Add)
        playSound()
    }
    
    @IBAction func onSubtractPressed (btn :AnyObject){
        processOperation(Op.Subtract)
        playSound()
    }
    
    @IBAction func onMultiplyPressed (btn: AnyObject){
        processOperation(Op.Multiply)
        playSound()
    }
    
    @IBAction func onDividePressed (btn:AnyObject){
        processOperation(Op.Divide)
        playSound()
    }
    
    @IBAction func onEqualsPressed(btn:AnyObject){
        processOperation(currentop)
        playSound()
    }
    
    
    func processOperation (op : Op ){
        
        if currentop != Op.Empty{
            
            rightVal = displayNo
            displayNo = ""
            
            if rightVal != ""{
                switch(currentop){
                case Op.Add :
                    result = "\(Double(leftVal)! + Double(rightVal)!)"
                    break
                case Op.Subtract :
                    result =  "\(Double(leftVal)! - Double(rightVal)!)"
                    break
                case Op.Multiply :
                    result = "\(Double(leftVal)! * Double(rightVal)!)"
                    break
                case Op.Divide :
                    result = "\(Double(leftVal)! / Double(rightVal)!)"
                    break
                default : break
                }
                display.text = result
                leftVal = result
                
            }
            currentop = op
            
        }else{
            leftVal = displayNo
            displayNo = ""
            currentop = op
        }
        
        
    }
    
    func playSound () {
        if btnSound.playing{
            btnSound.stop()
        }
        btnSound.play()
    }
    
}