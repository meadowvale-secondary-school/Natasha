import UIKit
import Photos

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var button: UIButton!
    
    private lazy var imagePickerController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        
        return imagePickerController
    }()
    private var imageData: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PHPhotoLibrary.requestAuthorization { status in
            guard case .authorized = status else {
                print("Not able to use photos!")
                return
            }
        }
    }
    
    private func displayImage() {
        guard let pickedImageData = imageData,
            let pickedImage = UIImage(data: pickedImageData)
            else {
                print("Unable to create a UIImage \(String(describing: self.imageData))")
                return
        } // Nothing to show
        UIView.transition(with: imageView, duration: 0.2, options: .transitionCrossDissolve, animations: {
            self.imageView.image = pickedImage
        }, completion: nil)
    }
    
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        present(imagePickerController, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate {
    @objc public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[.originalImage] as? UIImage else {
            print("Invalid image!")
            return
        }
        
        self.imageData = pickedImage.pngData()
        displayImage()
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UINavigationControllerDelegate {}
