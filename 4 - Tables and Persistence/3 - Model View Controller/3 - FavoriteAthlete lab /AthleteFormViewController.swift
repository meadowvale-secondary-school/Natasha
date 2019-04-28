//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Student04 on 2019-04-09.
//

import UIKit

class AthleteFormViewController: UIViewController {

    var athlete: Athlete? //optional since it will be nil when the user comes to the screen to create new athlete, with value when user edits the athlete
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    
    /////////
    @IBAction func saveButtonTapped(_ sender: Any) { //save button action
      //guard let is able unwrap multiple optionals of outlets for the textFields
        guard let name = nameTextField.text,
            let age = ageTextField.text,
            let team = teamTextField.text,
        let league = leagueTextField.text else { return } //returns nil if no values presented
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        
        performSegue(withIdentifier: "segueToAthleteForm", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        if let newAthlete = athlete { // unwrap athlete property
            newAthlete.description
            //need to include edited responses to the entries for when editing 
        }
    
    }
}
