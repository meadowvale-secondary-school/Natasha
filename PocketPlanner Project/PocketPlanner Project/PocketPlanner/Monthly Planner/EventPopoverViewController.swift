
import UIKit

class EventPopoverViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        dateLabel.text = dateString
    }
    
}
