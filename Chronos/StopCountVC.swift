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
    @IBOutlet weak var labelDisplay: UILabel!
    

    let stopCount = StopCount.sharedInstance

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(StopCountVC.updateNotificationSentLabel), name: NSNotification.Name(rawValue: TimerUpdated), object: stopCount)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

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
        
        stopCount.reset()
        labelDisplay.text = "00:00.00"
        
    }
        
    
    open func updateNotificationSentLabel() {
        

        var label1 = ""
        //calculate the minutes in elapsed time.
        
        var elapsedTime: TimeInterval = stopCount.getTimer()
        
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (TimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= TimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strFraction = String(format: "%02d", fraction)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        label1 = "\(strMinutes):\(strSeconds).\(strFraction)"
        print("label1:", label1)
        
  //      label.text = label1
        
        labelDisplay.text = "\(strMinutes):\(strSeconds).\(strFraction)"
        
 
    }
}


