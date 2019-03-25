//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Student04 on 2019-03-23.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet weak var viewEventText: UILabel! //view event state label placeholder
    var eventNumber: Int = 1
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Middle View Controller - View Did Load")
        
        if let existingText = viewEventText.text { //unwraps label, necessary since optional (UILabel!)
            viewEventText.text = "\(existingText)\nEvent number \(eventNumber) was viewDidLoad" //starts a new line , describing the event and its event number
            eventNumber += 1 //increments by one, so the next time eventNumber is accessed, it will describe the next ebent number in the sequence
        }
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Middle View Controller - View Will Appear")
        
        if let existingText = viewEventText.text {
            viewEventText.text = "\(existingText)\nEvent number \(eventNumber) was viewWillAppear"
            eventNumber += 1
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Middle View Controller - View Did Appear")
        
        if let existingText = viewEventText.text {
            viewEventText.text = "\(existingText)\nEvent number \(eventNumber) was viewDidAppear"
            eventNumber += 1
        }
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Middle View Controller - View Will Disappear")
        
        
        if let existingText = viewEventText.text {
            viewEventText.text = "\(existingText)\nEvent number \(eventNumber) was viewWillDisappear"
            eventNumber += 1
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Middle View Controller - View Did Disappear")
        
        
        if let existingText = viewEventText.text {
            viewEventText.text = "\(existingText)\nEvent number \(eventNumber) was viewDidDisappear"
            eventNumber += 1
        }
    }
    
    
}
