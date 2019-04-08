//
//  ViewController.swift
//  Lab 2 - AppEventCount
//
//  Created by Student04 on 2019-04-08.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        func updateView() {
            didFinishLaunchingLabel.text = "The app has launched \(launchCount) times(s)"
            
            willResignActiveLabel.text = "The app has resigned Active \(resignActiveCount) times(s)"
            
            didBecomeActiveLabel.text = "The app has become active \(becomeActiveCount) times(s)"
            
            didEnterBackground.text = "The app entered the background \(enterBackgroundCount) times(s)"
            
            willTerminateLabel.text = "The app was terminated \(terminateCount) times(s)"
        }
    }
    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    var launchCount = 0
    @IBOutlet weak var willResignActiveLabel: UILabel!
    var resignActiveCount = 0
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    var becomeActiveCount = 0
    @IBOutlet weak var didEnterBackground: UILabel!
    var enterBackgroundCount = 0
    @IBOutlet weak var willEnterForeground: UILabel!
    var enterForegroundCount = 0
    @IBOutlet weak var willTerminateLabel: UILabel!
    var terminateCount = 0
    
}


