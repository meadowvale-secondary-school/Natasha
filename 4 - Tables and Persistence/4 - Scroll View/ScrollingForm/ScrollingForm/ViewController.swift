//
//  ViewController.swift
//  ScrollingForm
//
//  Created by Student04 on 2019-04-11.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerForKeyboardNotifications()
    
    }
    @IBOutlet weak var scrollView: UIScrollView!
    

    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWasShown(_:)),
            name: .UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWillBeHidden(_:)),
            name: .UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWasShown(_ notificiation: NSNotification) {
        guard let info = notificiation.userInfo,
            let keyboardFrameValue =
            info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue
            else { return }
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0,
                                         bottom: keyboardSize.height, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
}
    
@objc func keyboardWillBeHidden(_ notification:
    NSNotification) {
    let contentInsets = UIEdgeInsetsMake(0.0,0.0, keyboardSize.height, 0.0)
    scrollView.contentInset = contentInsets
    scrollView.scrollIndicatorInsets = contentInsets
    }
}
