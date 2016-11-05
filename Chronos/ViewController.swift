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
    
    @IBOutlet weak var button: RoundButton!
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
            button.fillColor = UIColor.red
            button.borderColor = UIColor.black
            button.label = "STOP"
            aStato = Stato.START
            break
        case .START:
            button.fillColor = UIColor.black
            button.borderColor = UIColor.red
            button.label = "START"
            aStato = Stato.STOP
            break
        case .STOP:
            button.fillColor = UIColor.red
            button.borderColor = UIColor.black
            button.label = "STOP"
            aStato = Stato.START
            break
        default:
            button.backgroundColor = UIColor.red
            break
            
        }
        
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
}


