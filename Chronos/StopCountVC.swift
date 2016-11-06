//
//  ViewController.swift
//  Chronos
//
//  Created by Gianni Bacchiocchi on 01/11/16.
//  Copyright © 2016 Gianni Bacchiocchi. All rights reserved.
//

import UIKit


enum Stato {
    case IDDLE
    case START
    case STOP
    case RESET
}


var aStato = Stato.IDDLE


class StopCountVC: UIViewController {
    
    @IBOutlet weak var buttonStart: RoundButton!
    @IBOutlet weak var buttonReset: RoundButton!
    @IBOutlet weak var label: UILabel!
    



    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonStartPressed(_ sender: AnyObject) {
        
        switch aStato {
        case .IDDLE:
            buttonStart.fillColor = UIColor.red
            buttonStart.borderColor = UIColor.black
            buttonStart.labelColor = UIColor.black
            buttonStart.label = "STOP"
            aStato = Stato.START
            buttonReset.isEnabled = false
            
            label.text = "99:99:99"

            
            break
        case .START:
            buttonStart.fillColor = UIColor.black
            buttonStart.borderColor = UIColor.red
            buttonStart.labelColor = UIColor.red
            buttonStart.label = "START"
            aStato = Stato.STOP
            buttonReset.isEnabled = true
            break
        case .STOP:
            buttonStart.fillColor = UIColor.red
            buttonStart.borderColor = UIColor.black
            buttonStart.labelColor = UIColor.black
            buttonStart.label = "STOP"
            aStato = Stato.START
            buttonReset.isEnabled = false
            break
        default:
            print("buttonStart:", aStato)
            break
            
        }
        
    }
    

    @IBAction func buttonResetPressed(_ sender: AnyObject) {
        
        
        aStato = Stato.IDDLE
        
        buttonStart.fillColor = UIColor.black
        buttonStart.borderColor = UIColor.red
        buttonStart.labelColor = UIColor.red
        buttonStart.label = "START"
        
        buttonReset.isEnabled = false
        
        
        label.text = "00:00:00"
        
    }
        
    
    
    
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
}


