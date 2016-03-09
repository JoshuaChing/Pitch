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
    
    var audioPlayer: AVAudioPlayer!
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    
    enum ButtonType: Int {case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filePath = NSURL.fileURLWithPathComponents([dirPath, recordingName])
        try! audioFile = AVAudioFile(forReading: filePath!)
        try! audioPlayer = AVAudioPlayer(contentsOfURL: filePath!, fileTypeHint:nil)
        audioPlayer.enableRate = true
        audioPlayer.prepareToPlay()
        
        audioEngine = AVAudioEngine()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playSoundForButton(sender: UIButton) {
        resetAudio()
        
        switch(ButtonType(rawValue: sender.tag)!) {
        case .Slow:
            print("slow")
            audioPlayer.rate = 0.5
            audioPlayer.play()
            break
        case .Fast:
            print("fast")
            audioPlayer.rate = 2.0
            audioPlayer.play()
            break
        case .Chipmunk:
            print("chipmunk")
            playWithPitchChange(1000)
            break
        case .Vader:
            playWithPitchChange(-1000)
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
        resetAudio()
    }
    
    func resetAudio() {
        audioPlayer.stop()
        audioPlayer.rate = 1.0
        audioPlayer.currentTime = 0
        
        audioEngine.stop()
        audioEngine.reset()
    }
    
    func playWithPitchChange(pitch: Float) {
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        
        audioEngine.attachNode(changePitchEffect)
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        
        try! audioEngine.start()
        
        audioPlayerNode.play()
    }

}
