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
        
        updateView()
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
    
    func updateView() {
        didFinishLaunchingLabel.text = "The app has launched \(launchCount) time(s)"
        
        willResignActiveLabel.text = "The app has resigned Active \(resignActiveCount) time(s)"
        
        didBecomeActiveLabel.text = "The app has become active \(becomeActiveCount) time(s)"
        
        willEnterForeground.text = "The app has entered the foreground \(enterForegroundCount) time(s)"
        
        didEnterBackground.text = "The app entered the background \(enterBackgroundCount) time(s)"
        
        willTerminateLabel.text = "The app was terminated \(terminateCount) time(s)"
    }
    
}


