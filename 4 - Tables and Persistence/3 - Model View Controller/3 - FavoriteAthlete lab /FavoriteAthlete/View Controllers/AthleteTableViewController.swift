import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
        static let editAthleteSegue = "EditAthlete"
    }
    
    var athletes: [Athlete] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description
        
        return cell
        
    }
    //SEGUE - from tableViewController to AthleteFormViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //need to downcast destination (UIViewController) as subclass - AthletesFormViewController by using as! in order to set new type and access its properties
        let athleteFormViewController = segue.destination as! AthleteFormViewController
       
        //get index path of the selected cell, use to retrieve right Athlethe object from athletes array (need to unwrap since index path is optional
        if let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == PropertyKeys.editAthleteSegue { //check segue identifer is "EditAthlete",
            athleteFormViewController.athlete = athletes[indexPath.row] //if so, assign the right athlethe to the destination view controller's athlete property
        }
        
    }
    
    //in event that new athlete added or existing has been edited, allow the  AthleteTableViewController to access the Atlethe object from FormViewController
    @IBAction func unwindToAthleteFormVC(segue: UIStoryboardSegue) {
        //downcast type of segue from AthleteTableViewController to AthleteFormViewController in order to access property
        let athleteFormViewControllerSegue = segue.source as! AthleteFormViewController
        
        guard let athlete = athleteFormViewControllerSegue.athlete else { return }
        
        //indexPath, if any selected, before segue to Athlete:
        if let indexPath = tableView.indexPathForSelectedRow { //using conditional binding to discover path, if unwrapped, Athlete object coming back is an edited athlete, no longer a
            athletes.remove(at: indexPath.row) //removes existing athlete from athletes array, inserting edited athlete in its place:
            athletes.insert(athlete, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            athletes.append(athlete) //if unsucessfully unwrapped, Athlete object comes back as new athlete, which is just appeneded to the end of the athletes array
        }
    }
    
}
