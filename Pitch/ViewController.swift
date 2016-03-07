//
//  ViewController.swift
//  Pitch
//
//  Created by Joshua Ching on 2016-03-06.
//  Copyright © 2016 Joshua Ching. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopRecordButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startRecording(sender: AnyObject) {
        recordingLabel.text = "Recording in Progress"
        recordButton.enabled = false
        stopRecordButton.enabled = true
    }

    @IBAction func stopRecording(sender: AnyObject) {
        recordingLabel.text = "Tap to Record"
        recordButton.enabled = true
        stopRecordButton.enabled = false
    }

}

