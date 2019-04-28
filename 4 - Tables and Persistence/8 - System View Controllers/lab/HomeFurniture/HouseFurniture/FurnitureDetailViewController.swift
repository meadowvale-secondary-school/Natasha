
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
        if let imageData = furniture.imageData,
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
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        //ALERTS FINDER
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        //buttons for actions - will dismiss
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let chooseImageAlert = UIAlertAction(title: "Choose Image", style: .default, handler: nil)
        let takeNewImageAlert = UIAlertAction(title: "New Image", style: .default, handler: nil)

        //actions for alertController
        alertController.addAction(cancelAction)
        alertController.addAction(chooseImageAlert)
        alertController.addAction(takeNewImageAlert)

        present(alertController, animated: true, completion: nil)
        
        //IMAGE PICKER ACTION - For photo library - check to see if available
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {
                (_) in imagePicker.sourceType = .photoLibrary
            })
            alertController.addAction(photoLibraryAction)
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //tells the delegate a user has chosen a photo and includes the photo in the info dictionary
   
    //add to info.plist - NSPhotoLibraryUsageDescription
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
       /* if let imageData = furniture.imageData,
            let image = UIImage(data: imageData) {
            choosePhotoButton.setTitle("", for: .normal)
            choosePhotoButton.setImage(image, for: .normal)
        } else {
            choosePhotoButton.setTitle("Choose Image", for: .normal)
            choosePhotoButton.setImage(nil, for: .normal)*/
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            furniture?.imageData = UIImagePNGRepresentation(image)
            dismiss(animated: true, completion: nil)
            updateView()
            }
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
