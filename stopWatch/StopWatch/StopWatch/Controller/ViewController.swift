//
//  ViewController.swift
//  StopWatch
//
//  Created by Tom Dobson on 6/20/18.
//  Copyright © 2018 Dobson Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseResetButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    //Taptic FeedBack
    let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
    
    //Load class when needed.
    lazy var stopWatch = StopWatch(withUILabel: timerLabel)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Disable pause button at start
        pauseResetButton.isEnabled = false
        
        //Prepare Taptic Feedback
        lightImpactFeedbackGenerator.prepare()
        
    }

    @IBAction func playButton(_ sender: Any) {
        //Fire Taptic Feedback
        lightImpactFeedbackGenerator.impactOccurred()
        
        //Start Timer
        stopWatch.runTimer()
        
        //Disable Play button if time already running. Enable Pause button.
        if(stopWatch.toggleTimerOnOff()) {
            playButton.isEnabled = false
            pauseResetButton.isEnabled = true
            
            //Set Pause Button Image
            pauseResetButton.setImage(UIImage(named: "Pause"), for: .normal)
        }
    }
    
    @IBAction func pauseResetButton(_ sender: Any) {
        //Fire Taptic Feedback
        lightImpactFeedbackGenerator.impactOccurred()
        
        //Stop Timer
       stopWatch.stopTimer()
        
        //Enable Play button if time is stopped.
        if(!stopWatch.toggleTimerOnOff()) {
            playButton.isEnabled = true
            
            //Swap to Reset Button
            pauseResetButton.setImage(UIImage(named: "Reset"), for: .normal)
        } else {
            //If Time is already stopped when pressed, Reset Timer. Set Reset button back to Pause. Disable Pause Button.
            stopWatch.resetTimer()
            pauseResetButton.isEnabled = false
            pauseResetButton.setImage(UIImage(named: "Pause"), for: .normal)
        }
    }
    
}

