//
//  PlaySoundsViewController.swift
//  Pitch
//
//  Created by Joshua Ching on 2016-03-07.
//  Copyright © 2016 Joshua Ching. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    let recordingName = "pitchRecording.wav"
    
    var audioPlayer = AVAudioPlayer()
    
    enum ButtonType: Int {case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filePath = NSURL.fileURLWithPathComponents([dirPath, recordingName])
        try! audioPlayer = AVAudioPlayer(contentsOfURL: filePath!, fileTypeHint:nil)
        audioPlayer.enableRate = true
        audioPlayer.prepareToPlay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playSoundForButton(sender: UIButton) {

        audioPlayer.currentTime = 0
        audioPlayer.rate = 2.0
        
        switch(ButtonType(rawValue: sender.tag)!) {
        case .Slow:
            print("slow")
            audioPlayer.rate = 0.5
            break
        case .Fast:
            print("fast")
            audioPlayer.rate = 2.0
            break
        case .Chipmunk:
            print("chipmunk")
            audioPlayer.rate = 1.0
            break
        case .Vader:
            print("vader")
            audioPlayer.rate = 1.0
            break
        case .Echo:
            print("echo")
            break
        case .Reverb:
            print ("reverb")
            break
        }
        
        audioPlayer.play()
        
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        audioPlayer.stop()
    }

}
