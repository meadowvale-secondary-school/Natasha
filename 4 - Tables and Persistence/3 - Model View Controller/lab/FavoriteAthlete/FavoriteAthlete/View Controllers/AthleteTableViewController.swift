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
    
    @IBAction func unwindAddedNewAthlete(segue: UIStoryboard) {
        
    }
}
