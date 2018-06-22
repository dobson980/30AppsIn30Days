//
//  StopWatch.swift
//  StopWatch
//
//  Created by Tom Dobson on 6/21/18.
//  Copyright © 2018 Dobson Studios. All rights reserved.
//

import UIKit

class StopWatch {
    
    //Variables
    var timer = Timer()
    var time : Double = 0
    var startTime : Double = 0
    var elapsedTime : Double = 0
    var timerRunning = false
    var stopWatchLabel: UILabel
    
    //Initializers
    init(withUILabel label: UILabel) {
        self.stopWatchLabel = label
    }
    
    func runTimer() {
        //Sets start time; also evaluates if any time has previously elapsed.
        startTime = Date().timeIntervalSinceReferenceDate - elapsedTime
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(calculateTimeElapsed), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        //Grabs current time and compares to start time
        elapsedTime = Date().timeIntervalSinceReferenceDate - startTime
        timer.invalidate()
    }
    
    func resetTimer() {
        //Resets Timer to 00:00:00 (MM:SS:MS)
        startTime = 0
        time = 0
        elapsedTime = 0
        timerRunning = false
        updateTimeLabel(forLabel: stopWatchLabel, minutes: 0, seconds: 0, milliseconds: 0)
    }
    
    @objc func calculateTimeElapsed() {
    
        //Time Since Timer Started
        time = Date().timeIntervalSinceReferenceDate - startTime
        
        //Calculate Minutes
        let minutes = Int(time / 60)
        time -= (TimeInterval(minutes) * 60)
        
        //Caclulate Seconds
        let seconds = Int(time)
        time -= TimeInterval(seconds)
        
        //Calculate Milliseconds
        let milliseconds = Int(time * 100)
        
        //Pass Time Variables to Labe Update Function
        updateTimeLabel(forLabel: stopWatchLabel, minutes: minutes, seconds: seconds, milliseconds: milliseconds)
    
    }
    
    func updateTimeLabel(forLabel label: UILabel, minutes: Int, seconds: Int, milliseconds: Int) {
        //Sets Label to MM:SS:MS
        label.text = String(format:"%02i:%02i:%02i", minutes, seconds, milliseconds)
    }
    
    func toggleTimerOnOff() -> Bool {
        //If timer is running, return false. If timer is not running; return true.
        if(timerRunning) {
            timerRunning = false
            return timerRunning
        } else {
            timerRunning = true
            return timerRunning
        }
    }
    
    
}
