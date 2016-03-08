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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playSoundForButton(sender: UIButton) {
        print("play")
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        print("stop")
    }

}
