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
        
        //accessing the Camera using UIImagePickerController()
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        
        //Creating an alert popover view using UIAlertController()
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        //if camera source is available...
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Cancel", style: .default, handler: { action in imagePicker.sourceType  = .camera
               
                self.present(imagePicker,animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        //if photo library is available...
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { action in imagePicker.sourceType = .photoLibrary
                
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
        
    }
    
    
    
}

