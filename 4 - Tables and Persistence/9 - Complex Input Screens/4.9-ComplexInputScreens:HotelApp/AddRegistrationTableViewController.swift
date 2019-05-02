

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
   
    //personal info
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    //dates info to change
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    
    //number of adults and children section
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    //switch for wifi
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    //label for Room Type selection
    @IBOutlet weak var roomTypeLabel: UILabel!
    var roomType: RoomType?
    
    //implementing custom protocol method 
    func didSelect(roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    //create a model object instance with computed property - for staff to submit info for each entry
    var registration: Registration? {
        
        guard let roomType = roomType else { return nil } //in the return type isn't set nil, return a valid Registration object
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = "\(checkInDatePicker.date)"
        let checkOutDate = "\(checkOutDatePicker.date)" //or String()??
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn

        return Registration(firstName: firstName, lastName: lastName, emailAddress: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, roomType: roomType, wifi: hasWifi)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateNumberOfGuests()
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
    }
    
    
   //adjusting cell height properties
    //let properties stores the index path properties for easy comparision in delegate method
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    //var properties store whether or not the date picker will be shown and then will show or hide when the properties are set (Both date pickers start as not shown)
    var isCheckInDatePickerShown: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        } //checkInDatePicker not false, so hidden state is true
    }
    
    var isCheckOutDatePickerShown: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }

    
    func updateDateViews() {
        let dataFormatter = DateFormatter()
        dataFormatter.dateStyle = .medium
        
        //update the date labels from the date picker
        checkInDateLabel.text = dataFormatter.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = dataFormatter.string(from: checkOutDatePicker.date)
    }
    
    //return the height of the the date pickers using the index path
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) { //values type for cases of index [#,#]
        case (checkInDatePickerCellIndexPath.section, checkInDatePickerCellIndexPath.row): //check if index path is equal to one of the date picker cells
            if isCheckInDatePickerShown { //check if date picker was displayed
                return 216.0
            } else {
                return 0.0 //if the date picker is not shown, the height is 0
            }
        case (checkOutDatePickerCellIndexPath.section, checkOutDatePickerCellIndexPath.row):
            if isCheckOutDatePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        default: ///for all other cell heights, the default will be 44 
            return 44.0
        }
    }
    
    //To show the date pickers, need to respond to user's cell selection
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //deselect the cell when tapped
        
        //three conditions of the check in/out labels:
        switch (indexPath.section, indexPath.row) {
           
        //if the check-in label is selected
        case (checkInDatePickerCellIndexPath.section, checkInDatePickerCellIndexPath.row - 1):
            if isCheckInDatePickerShown { //if the date picker for the selected cell is already shown, hide it
                isCheckInDatePickerShown = false
                
            } else if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false //if the other date picker is shown, hide and show the selected one
                isCheckInDatePickerShown = true
                
            } else {
                isCheckInDatePickerShown = true //if neither date picker is shown, show the selected date picker
            }
            
            //tell the table view to requery its attributes - including cell height 
            tableView.beginUpdates()
            tableView.endUpdates()
            
        //if the check-out label is selected
        case (checkOutDatePickerCellIndexPath.section, checkOutDatePickerCellIndexPath.row - 1):
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
                
            } else if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
                
            } else {
                isCheckOutDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
          
        //if any other row is selected
        default:
            break
        }
    }
//COLLECT NUMBERS - from form entry 
    
    //assign the number text to the stepper value
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        //implement later
    }
    
    //SELECT ROOM TYPE - update labels for room types
    func updateRoomType() { //allows the selected room type to be displayed once chosen or set to default
        if let roomType = roomType {
        roomTypeLabel.text = roomType.name
        } else {
            roomTypeLabel.text = "Not Set"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectRoomType" {
            let destinationViewController = segue.destination as?
            SelectRoomTypeTableViewController
            destinationViewController?.delegate = self //set the delegate property and of the roomType property if a selection has already been made
            destinationViewController?.roomType = roomType
        }
    }
    
   
    @IBAction func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
