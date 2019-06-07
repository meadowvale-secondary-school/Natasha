//
//  AnimationViewController.swift
//  PocketPlanner
//
//  Created by Student04 on 2019-06-07.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func moveCloudRight(image: UIImage) {
        let positionAnimation = CABasicAnimation(keyPath: "position")
        
        positionAnimation.fromValue = NSValue(cgPoint: CGPoint(x: image.center.x + 70, y: image.center.y))
        positionAnimation.toValue = NSValue(cgPoint: CGPoint(x: image.center.x, y: label.center.y))
        positionAnimation.duration = 0.2
        
        
    }


}
