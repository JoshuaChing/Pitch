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
    
    var recordedAudio: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType: Int {case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playSoundForButton(sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .Slow:
            print("slow")
            break
        case .Fast:
            print("fast")
            break
        case .Chipmunk:
            print("chipmunk")
            break
        case .Vader:
            print("vader")
            break
        case .Echo:
            print("echo")
            break
        case .Reverb:
            print ("reverb")
            break
        }
        
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        
    }

}
