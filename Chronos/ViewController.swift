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

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonStart: RoundButton!
    @IBOutlet weak var label: UILabel!
    
    var aStato = Stato.IDDLE
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        switch aStato {
        case .IDDLE:
            buttonStart.fillColor = UIColor.red
            buttonStart.borderColor = UIColor.black
            buttonStart.labelColor = UIColor.black
            buttonStart.label = "STOP"
            aStato = Stato.START
            break
        case .START:
            buttonStart.fillColor = UIColor.black
            buttonStart.borderColor = UIColor.red
            buttonStart.labelColor = UIColor.red
            buttonStart.label = "START"
            aStato = Stato.STOP
            break
        case .STOP:
            buttonStart.fillColor = UIColor.red
            buttonStart.borderColor = UIColor.black
            buttonStart.labelColor = UIColor.black
            buttonStart.label = "STOP"
            aStato = Stato.START
            break
        default:
            print("buttonStart:", aStato)
            break
            
        }
        
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
}


