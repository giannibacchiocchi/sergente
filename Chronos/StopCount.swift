//
//  StopCount.swift
//  Chronos
//
//  Created by Gianni Bacchiocchi on 06/11/16.
//  Copyright © 2016 Gianni Bacchiocchi. All rights reserved.
//

import Foundation


class StopCount {
    
    fileprivate var timer = Timer()
    fileprivate var startTime = TimeInterval(0)
    fileprivate var elapsedSinceLastRefresh = TimeInterval(0)
    
 //   static let sharedInstance = StopCount()
    
    open var refreshInterval = TimeInterval(1)
    
    
    
    open func start() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: self.refreshInterval,
                                         target: self,
                                         selector: #selector(StopCount.refreshTime),
                                         userInfo: nil,
                                         repeats: true)
            
            startTime = Date.timeIntervalSinceReferenceDate
        }

    }
    
    open func stop() {
        timer.invalidate()
        elapsedSinceLastRefresh = 0
    }
    
    open func reset() {
        timer.invalidate()
        elapsedSinceLastRefresh = 0
    }

    @objc func refreshTime() {
        let refreshTime = Date.timeIntervalSinceReferenceDate
        self.elapsedSinceLastRefresh = (refreshTime - startTime)
        
        // notifica
        
    }
    
    
    
    open func getTimer() {
        
    }
    
    
}
