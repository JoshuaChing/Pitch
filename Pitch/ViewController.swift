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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startRecording(sender: AnyObject) {
        recordingLabel.text = "Recording in Progress"
    }

    @IBAction func stopRecording(sender: AnyObject) {
    }
}
