//
//  StopCount.swift
//  Chronos
//
//  Created by Gianni Bacchiocchi on 06/11/16.
//  Copyright © 2016 Gianni Bacchiocchi. All rights reserved.
//

import Foundation


let TimerUpdated = "StopCountTimerUpdated";


class StopCount : NSObject {

    class var sharedInstance : StopCount {
        struct Static {
            static let instance : StopCount = StopCount()
        }
        return Static.instance
    }
    
 //   private override init() {
        
 //   }
 
    public convenience init(refreshInterval: TimeInterval) {
        self.init()
        self.refreshInterval = refreshInterval
    }
    
    fileprivate var timer = Timer()
    fileprivate var startTime = TimeInterval(0)
    fileprivate var accumulatedTime = TimeInterval(0)
    fileprivate var elapsedSinceLastRefresh = TimeInterval(0)
    
 //   static let sharedInstance = StopCount()
    
    open var elapsedTime: TimeInterval {
        return elapsedSinceLastRefresh + accumulatedTime
    }

    
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
        accumulatedTime = elapsedTime
        elapsedSinceLastRefresh = 0
    }
    
    open func reset() {
        timer.invalidate()
        elapsedSinceLastRefresh = 0
        accumulatedTime = 0        
    }

    func refreshTime() {
        let refreshTime = Date.timeIntervalSinceReferenceDate
        self.elapsedSinceLastRefresh = (refreshTime - startTime)        
        NotificationCenter.default.post(name: Notification.Name(rawValue: TimerUpdated), object: self)
    
    }
    
    
    
    open func getTimer() -> TimeInterval  {
        
        return elapsedSinceLastRefresh
        
    }
    
    
}
