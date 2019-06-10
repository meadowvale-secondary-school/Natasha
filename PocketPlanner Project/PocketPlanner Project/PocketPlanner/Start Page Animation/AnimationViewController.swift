//
//  AnimationViewController.swift
//  PocketPlanner
//
//  Created by Student04 on 2019-06-07.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    @IBOutlet weak var leadingCloudOne: NSLayoutConstraint!
    @IBOutlet weak var trailingCloudTwo: NSLayoutConstraint!
    @IBOutlet weak var leadingCloudThree: NSLayoutConstraint!
    @IBOutlet weak var trailingCloudFour: NSLayoutConstraint!
    
    @IBOutlet weak var loginButton: UIButton!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        leadingCloudOne.constant -= view.bounds.width
        trailingCloudTwo.constant -= view.bounds.width
        leadingCloudThree.constant -=  view.bounds.width
        trailingCloudFour.constant -= view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 4.2, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.leadingCloudOne.constant += self.view.bounds.width
            
            self.trailingCloudTwo.constant += self.view.bounds.width
            
            self.leadingCloudThree.constant += self.view.bounds.width

            self.trailingCloudFour.constant += self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //
    //  startPageAnimation.swift
    //  PocketPlanner
    //
    //  Created by Student04 on 2019-06-05.
    //  Copyright © 2019 Student04. All rights reserved.
    //
    


}
