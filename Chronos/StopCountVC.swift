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
    

    let stopCount = StopCount.sharedInstance

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(StopCountVC.updateNotificationSentLabel), name: NSNotification.Name(rawValue: TimerUpdated), object: stopCount)
        
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
            stopCount.start()
          //  label.text = "99:99:99"
            break
        case .START:
            buttonStart.fillColor = UIColor.black
            buttonStart.borderColor = UIColor.red
            buttonStart.labelColor = UIColor.red
            buttonStart.label = "START"
            aStato = Stato.STOP
            buttonReset.isEnabled = true
            stopCount.stop()
            break
        case .STOP:
            buttonStart.fillColor = UIColor.red
            buttonStart.borderColor = UIColor.black
            buttonStart.labelColor = UIColor.black
            buttonStart.label = "STOP"
            aStato = Stato.START
            buttonReset.isEnabled = false
            stopCount.start()            
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
        
    
    open func updateNotificationSentLabel() {
        
        var ti = NSInteger(stopCount.getTimer())
 //       var ms = Int((stopCount.getTimer().truncatingRemainder(dividingBy: 1)) * 1000)
        
        var seconds = ti % 60
        var minutes = (ti / 60) % 60
        var hours = (ti / 3600)
        

 //       let label = String(format: "%0.2d:%0.2d:%0.2d.%0.3d",hours,minutes,seconds,ms)
          label.text = String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
        

  //      print("label:", label)
        
 
    }
}


