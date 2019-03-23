//
//  ViewController.swift
//  3.8-ViewControllerLifeCycles
//
//  Created by Student04 on 2019-03-21.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //VIEW DID LOAD - good for work that needs to be updated once, like font, text, color
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Controller - View Did Load")
    }
    
    //VIEW WILL APPEAR - setting up work that needs to be performed for a few seconds before the view is loaded
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) //viewWillAppear(_:) requires parameter "animated", thus passed in subclass
        print("View Controller - View Will Appear")
        
    }
    
    //VIEW DID APPEAR - If your works needs to be performed each time the view appears, and needs a couple of seconds
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View Controller - View DID Appear")
    }

    //VIEW WILL DISAPPEAR - Called before the view disappears from the screen
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View Controller - View Will Disappear")
    }
    //VIEW DID DISAPPEAR - - Called after the view disappears from the screen
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("View Controller - View DID Disappear")
        
    }

}

