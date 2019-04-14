//
//  ViewController.swift
//  ISpy
//
//  Created by Student04 on 2019-04-11.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate { //protocol allows for zooming
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sets the scroll view's delegate to ViewController, telling the scroll view to call the view controller with the scroll view methods
        scrollView.delegate = self
        
        //calls method to update the view
        updateZoomFor(size: view.bounds.size)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView //returns the view chosen, in this case imageView (if not nil). Can be any view that contains many other views too.
    }
    
    func updateZoomFor(size: CGSize) {
        //method created to update the zoom of the image
        
        //calculates the scale to display the entire width and height of the image
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        
        //sets the scale to be the smaller of the two (width or height), so the entire image will appear on the screen
        let scale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = scale
    }


}

