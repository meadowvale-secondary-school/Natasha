import UIKit

import Foundation
class ToDoViewController: UITableViewController {
    
    //New ToDo controls to change
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePickerView: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //property will be nil until properties are set and save button enabled
    var todo: ToDo?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let todo = todo {
            navigationItem.title = "To-Do"
            titleTextField.text = todo.title
            isCompleteButton.isSelected = todo.isComplete
            dueDatePickerView.date = todo.dueDate
            notesTextView.text = todo.notes
        } else {
            //when the date picker is displayed, the date picker displays a starting value 24 hours after the current time
            dueDatePickerView.date = Date().addingTimeInterval(24*60*60)
        }
        //save button is disabled as soon as view loads
        updateDueDateLabel(date: dueDatePickerView.date)
        updateSaveButtonState()

    }
    //will respond when return button pressed, resigning or returning from keyboard
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    
    //updates save button based on fact that text field is not empty
    func updateSaveButtonState() {
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    @IBAction func textEditingChanged(_ sender: Any) {
        updateSaveButtonState() //prevents the user from creating a to do without a title
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        //when tapped, toggled as selected and unselected, and vise versa 
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
    
    //formatting the due date label to update it's text using the date picker and dateFormatter property
    func updateDueDateLabel(date: Date) {
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    //an action that is fired whenever the user changes the date picker 
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePickerView.date) //always displays a string of text that matches the value in the date picker
    }
    // MARK: - Table view data source
    
    
    //EXPAND and COLLAPSE the date picker cell
    var isPickerHidden = true
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let normalCellHeight = CGFloat(44)
        let largeCellHeight = CGFloat(200)
        
        switch(indexPath) {
        case [1,0]: //Due Date Cell (2nd section, row 1)
            return isPickerHidden ? normalCellHeight : largeCellHeight
            //if the picker is hidden, hide at normal height, if not expand to large cell height
            
        case [2,0]: //Notes Cell ( 3rd section, row 1)
            return largeCellHeight
            
        default:
            return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath) {
        case [1,0]: //when at section 2, row 1
            isPickerHidden = !isPickerHidden //changes picker to false
            
            //updates accordingly text color
            dueDateLabel.textColor = isPickerHidden ? .black : tableView.tintColor
            
            //to animate cell height adjustment, call these updates
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default: break
        }
    }
   
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        //need to verify the saveUnwind segue is being performed
        guard segue.identifier == "saveUnwind" else { return }
        
        //reads the values from the controls, storing as constants and passing values into your model's initalizers
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDatePickerView.date
        let notes = notesTextView.text
        
        todo = ToDo(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
     }
 
    
}



