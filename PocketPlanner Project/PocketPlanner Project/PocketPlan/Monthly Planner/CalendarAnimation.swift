
import UIKit

func moveAnimationNext(label: UILabel){
    let positionAnimation = CABasicAnimation(keyPath: "position")
    //moves label
    positionAnimation.fromValue = NSValue(cgPoint: CGPoint(x: label.center.x + 70, y: label.center.y))
    positionAnimation.toValue = NSValue(cgPoint: CGPoint(x: label.center.x, y: label.center.y))
    positionAnimation.duration = 0.2

   
    let fadeAnimation = CABasicAnimation(keyPath: "opacity")
    fadeAnimation.fromValue = 0 //animation appears
    fadeAnimation.toValue = 1
    fadeAnimation.duration = 0.2
    
    label.layer.add(positionAnimation, forKey: nil)
    label.layer.add(fadeAnimation, forKey: nil)
}



func moveAnimationBack(label: UILabel) {
    //moves label
    let positionAnimation = CABasicAnimation(keyPath: "position")
    positionAnimation.fromValue = NSValue(cgPoint: CGPoint(x: label.center.x - 70, y: label.center.y))
    positionAnimation.toValue = NSValue(cgPoint: CGPoint(x: label.center.x, y: label.center.y))
    positionAnimation.duration = 0.2
    
    
    let fadeAnimation = CABasicAnimation(keyPath: "opacity")
    fadeAnimation.fromValue = 0 //animation appears
    fadeAnimation.toValue = 1
    fadeAnimation.duration = 0.2
    
    label.layer.add(positionAnimation, forKey: nil)
    label.layer.add(fadeAnimation, forKey: nil)
    
}

