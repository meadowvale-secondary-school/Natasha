
import UIKit


class EventPopoverViewController: UIViewController {
    
    @IBOutlet weak var blueEventButton: UIButton!

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventStartTimeTextField: UITextField!
    @IBOutlet weak var eventEndTimeTextfield: UITextField!
    
    @IBOutlet weak var eventNameTextField: UITextField!
    private var startDatePicker: UIDatePicker?
    private var endDatePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateLabel.text = dateString
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EventPopoverViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        //START DATE PICKER
        //date picker for event timings
        startDatePicker = UIDatePicker()
        startDatePicker?.datePickerMode = .time
        startDatePicker?.addTarget(self, action: #selector(EventPopoverViewController.dateChanged(datePicker:)), for: .valueChanged)
        //can change to label
        eventStartTimeTextField.inputView = startDatePicker
        
        //END DATE PICKER
        endDatePicker = UIDatePicker()
        endDatePicker?.datePickerMode = .time
        endDatePicker?.addTarget(self, action: #selector(EventPopoverViewController.endDateChanged(endDatePicker:)), for: .valueChanged)
        //can change to label
        eventEndTimeTextfield.inputView = endDatePicker
    
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        eventStartTimeTextField.textColor = .blue
        eventStartTimeTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc func endDateChanged(endDatePicker: UIDatePicker) {
        //END DATE PICKER
        let endDateFormatter = DateFormatter()
        endDateFormatter.dateFormat = "h: mm a"
        eventEndTimeTextfield.textColor = .blue
        eventEndTimeTextfield.text = endDateFormatter.string(from:endDatePicker.date)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        eventStartTimeTextField.textColor = .black
        eventEndTimeTextfield.textColor = .black

    }
    
    /*EDITS to make
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }*/
}
