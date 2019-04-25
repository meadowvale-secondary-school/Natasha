
import UIKit

class FurnitureDetailViewController: UIViewController {
    
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
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        //buttons for actions - will dismiss
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let chooseImageAlert = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let takeNewImageAlert = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        //actions for alertController
        alertController.addAction(cancelAction)
        alertController.addAction(chooseImageAlert)
        alertController.addAction(takeNewImageAlert)

        present(alertController, animated: true, completion: nil)
    }

    @IBAction func actionButtonTapped(_ sender: Any) {
        
    }
    
}
