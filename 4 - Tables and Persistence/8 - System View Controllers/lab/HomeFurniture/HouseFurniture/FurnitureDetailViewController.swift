
import UIKit

class FurnitureDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    var furniture: Furniture?
    
    @IBOutlet weak var choosePhotoButton: UIButton!
    @IBOutlet weak var furnitureTitleLabel: UILabel!
    @IBOutlet weak var furnitureDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        guard let furniture = furniture else {return}
        if let imageData = furniture.imageData, //reverts to else condition
            let image = UIImage(data: imageData) {
            choosePhotoButton.setTitle("", for: .normal)
            choosePhotoButton.setImage(image, for: .normal)
        } else {
            choosePhotoButton.setTitle("Choose Image", for: .normal)
            choosePhotoButton.setImage(nil, for: .normal)
        }
        furnitureTitleLabel.text = furniture.name
        furnitureDescriptionLabel.text = furniture.description
    }
    
    @IBAction func choosePhotoButtonTapped(_ sender: Any) {
        //IMAGE PICKER
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

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //tells the delegate a user has chosen a photo and includes the photo in the info dictionary

    //add to info.plist - NSPhotoLibraryUsageDescription
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            furniture?.imageData = UIImagePNGRepresentation(image)
            }
        dismiss(animated: true, completion: nil)
        updateView()
        }
    //share the image
    @IBAction func actionButtonTapped(_ sender: Any) {
        guard let image = furniture?.imageData else { return }
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil) //includes image in the array
        activityController.popoverPresentationController?.sourceView = sender as? UIView
        
        //presents to the user (activityController)
        present(activityController, animated: true, completion: nil)
        }
    }
