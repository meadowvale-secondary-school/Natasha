//
//  AddEditEmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Student04 on 2019-04-16.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController {

    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //check to see if emoji has a value, if it does, editing exisiting Emoji, if not, created to display new Emoji
        if let emoji = emoji { //updates with corresponding emoji values
            symbolTextField.text = emoji.symbol
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.description
            usageTextField.text = emoji.usage
        }
        
        updateSaveButtonState() //button is disabled after being modally presented, or enabled if pushed to view controller
    }

    var emoji: Emoji?
    
    //updates the save button to contain text is presented in text field, or set to empty if there is non. If all of the text field sections are filled out, the save button is enabled
    func updateSaveButtonState() {
        let symbolText = symbolTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        let usageText = usageTextField.text ?? ""
        saveButton.isEnabled = !symbolText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty
        
    }
    
    //connected to each text field to check whether all fields are filled in and continously checked when pressed
    @IBAction func textEditingChanged(_sender: UITextField) {
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else {return} //ensures that saveUnwind segue is being performed, so that the cancel button doesn't perform work when segue triggered
        
        //before segue is completed, construct new Emoji model object and set it to the emoji property, the property can be used to update the collection 
        let symbol = symbolTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        let usage = usageTextField.text ?? ""
        emoji = Emoji(symbol: symbol, name: name, description: description, usage: usage)
    }
    
    
}

