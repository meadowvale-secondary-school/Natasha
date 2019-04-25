//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by Student04 on 2019-04-24.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit
import SafariServices //need to use SFSafariViewController


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //activityItems - array of type Any, which items are passed into
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        guard let image = imageView.image else { return }
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil) //includes image in the array
        activityController.popoverPresentationController?.sourceView = sender
        
        //presents to the user (activityController)
        present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func safariButtonTapped(_ sender: UIButton) {
        if let url = URL(string:"http://www.apple.com") { //specifiy url (unwrap)
            let safariViewController = SFSafariViewController(url: url)
            //create an instance of the view controller with the url
           
            //present the safarViewController to the user
            present(safariViewController,animated: true, completion: nil)
        }
    }
    //.actionSheet places alert at bottom of scree, .alert in center
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //execute action when selected for button
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {
            action in print("User selected Camera action")
        })
        
        //another button
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {
            action in print("User selected Photo Library action")
        })
        
        //adds to the alert controller
        alertController.addAction(cancelAction)
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        
        //so that popover presents properly on an Ipad 
        alertController.popoverPresentationController?.sourceView = sender
        
        present(alertController, animated: true, completion: nil)
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
        
    }
    
    
    
}

