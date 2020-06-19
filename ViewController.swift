//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    @IBOutlet weak var question: UILabel!
    let eggTimes = ["Soft" : 3, "Medium" : 4, "Hard" : 7 ]
    var secondsPassed = 0
    var timer = Timer()
    var count=0
    
    func playSound() {
              let url = Bundle.main.url(forResource:"alarm_sound", withExtension: "mp3")
              player = try! AVAudioPlayer(contentsOf: url!)
              player.play()
                      
          }

    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let buttonPressed = sender.currentTitle!
        secondsPassed=0
        progressView.progress = 0.0
        question.text = buttonPressed
        count =  eggTimes[buttonPressed]!
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

}
    @objc func updateTimer() {
        if(secondsPassed < count){
            print("\(secondsPassed)  seconds done")
            progressView.progress = (Float(secondsPassed)/Float(count))
            secondsPassed+=1
           
            
           
        }
        else{
            question.text = "Done"
            progressView.progress = 1.0
            playSound()
            
        }
      
    }
}
