
import UIKit

var eventNameTitle = ""

class EventPopoverViewController: UIViewController {
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var eventDetails: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventStartTimeTextField: UITextField!
    @IBOutlet weak var eventEndTimeTextfield: UITextField!
    @IBOutlet weak var eventNameTextField: UITextField!
    
    private var startDatePicker: UIDatePicker?
    private var endDatePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //updateSaveButtonState()
        
//ADDING NEW DATE FROM CALENDAR
        dateLabel.text = dateString
        
        //Choosing Start and End Date Pickers 
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EventPopoverViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        //START DATE PICKER
        //date picker for event timings
        startDatePicker = UIDatePicker()
        startDatePicker?.datePickerMode = .time
        startDatePicker?.addTarget(self, action: #selector(EventPopoverViewController.dateChanged(datePicker:)), for: .valueChanged)
        //change to label:
        eventStartTimeTextField.inputView = startDatePicker
        
        //END DATE PICKER
        endDatePicker = UIDatePicker()
        endDatePicker?.datePickerMode = .time
        endDatePicker?.addTarget(self, action: #selector(EventPopoverViewController.endDateChanged(endDatePicker:)), for: .valueChanged)
        //change to label:
        eventEndTimeTextfield.inputView = endDatePicker
    
    }
    //DATE PICKER FUNCTIONS
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        eventStartTimeTextField.textColor = .black
        eventStartTimeTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc func endDateChanged(endDatePicker: UIDatePicker) {
        //END DATE PICKER
        let endDateFormatter = DateFormatter()
        endDateFormatter.dateFormat = "h: mm a"
        eventEndTimeTextfield.textColor = .black
        eventEndTimeTextfield.text = endDateFormatter.string(from:endDatePicker.date)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        eventStartTimeTextField.textColor = .black
        eventEndTimeTextfield.textColor = .black

    }
    
    //update Save Button
   func updateSaveButtonState() {
        let text = eventNameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
        if saveButton.isEnabled {
            saveButton.tintColor = .white
        } else if !saveButton.isEnabled {
                self.saveButton.tintColor = .blue
            }
    }
    
    //keep track of button state
    @IBAction func textEditingChanged(_ sender: Any) {
        //updateSaveButtonState()
    }
    @IBAction func returnPressed(_ sender: UITextField) {
        eventNameTextField.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let eventManager = segue.destination as? EventManagementDelegate else { return }
        //reads the values from the controls, storing as constants and passing values into your model's initalizers
        // eventNameTitle = dateLabel.text ?? ""
        let title = eventNameTextField.text!
        let dateText = dateLabel.text!
        let startTime = eventStartTimeTextField.text!
        let endTime = eventEndTimeTextfield.text!
        let eventNotes = eventDetails.text!
        
        let event = Event(eventTitle: title, eventDate: dateText, startTime: startTime, endTime: endTime, eventDetails: eventNotes)
        eventManager.addNew(event)
    }
    
}
