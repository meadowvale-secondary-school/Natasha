//
//  ViewController.swift
//  L4.ScrollView-keyboardHandling
//
//  Created by Student04 on 2019-04-11.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit

    class ViewController: UIViewController {
        @IBOutlet weak var scrollView: UIScrollView!
        
        @IBOutlet weak var contentView: UIView!
        @IBOutlet weak var textFieldA: UITextField!
        @IBOutlet weak var textFieldB: UITextField!
        @IBOutlet weak var textFieldC: UITextField!
        
        // Constraints
        @IBOutlet weak var constraintContentHeight: NSLayoutConstraint!
        
        var activeField: UITextField?
        var lastOffset: CGPoint!
        var keyboardHeight: CGFloat!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            // Set textfield delegate
            textFieldA.delegate = self
            textFieldB.delegate = self
            textFieldC.delegate = self
            
            // Observe keyboard change
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil) //update to accesss UIResponder property type!!!
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
            
            // Add touch gesture for contentView
            self.contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(returnTextView(gesture:))))
        }
        
        @objc func returnTextView(gesture: UIGestureRecognizer) {
            guard activeField != nil else {
                return
            }
            
            activeField?.resignFirstResponder()
            activeField = nil
        }
    }
    
    // MARK: UITextFieldDelegate
    extension ViewController: UITextFieldDelegate {
        func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            activeField = textField
            lastOffset = self.scrollView.contentOffset
            return true
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            activeField?.resignFirstResponder()
            activeField = nil
            return true
        }
    }
    
    // MARK: Keyboard Handling
    extension ViewController {
        @objc func keyboardWillShow(notification: NSNotification) {
            if keyboardHeight != nil {
                return
            }
            
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                keyboardHeight = keyboardSize.height
                
                // so increase contentView's height by keyboard height
                UIView.animate(withDuration: 0.3, animations: {
                    self.constraintContentHeight.constant += self.keyboardHeight
                })
                
                // move if keyboard hide input field
                let distanceToBottom = self.scrollView.frame.size.height - (activeField?.frame.origin.y)! - (activeField?.frame.size.height)!
                let collapseSpace = keyboardHeight - distanceToBottom
                
                if collapseSpace < 0 {
                    // no collapse
                    return
                }
                
                // set new offset for scroll view
                UIView.animate(withDuration: 0.3, animations: {
                    // scroll to the position above keyboard 10 points
                    self.scrollView.contentOffset = CGPoint(x: self.lastOffset.x, y: collapseSpace + 10)
                })
            }
        }
        
        @objc func keyboardWillHide(notification: NSNotification) {
            UIView.animate(withDuration: 0.3) {
                self.constraintContentHeight.constant -= self.keyboardHeight
                
                self.scrollView.contentOffset = self.lastOffset
            }
            
            keyboardHeight = nil

        }
    }
    



