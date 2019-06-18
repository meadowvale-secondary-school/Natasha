import UIKit

class NotesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = editButtonItem

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManagers.notes.data.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell") as? NotesCell else {
            fatalError("Could not deque a cell")
        }
        
       /* //CURRENT DATE FORMATTER (using Note object date string)
        let dateFormatter : DateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.dateFormat = "E, d MMM yyy"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        //EEEE, MMM d, yyyy*/
        
        //Get the model out of the array that corresponds to the cell being displayed
        let note = DataManagers.notes.data[indexPath.row]
        //update the cell's properties accordingly
        cell.titleLabel?.text = note.title
        cell.dateLabel?.text = note.currentDate
        cell.taskDetails?.text = note.notes
        //return the cell from the method
        
        return cell
        
    }
    
    //choose which cells are editable
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //When the cell is swiped, a red delete button app
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete { //verify the Delete button triggered the method call
            DataManagers.notes.data.remove(at: indexPath.row) //delete the model from the array
            tableView.deleteRows(at: [indexPath], with: .fade) //as well as from the table view
        }
    }
    
    @IBAction func unwindNotesList(_ segue: UIStoryboardSegue) {
        guard segue.identifier == "saveNoteUnwind" else { return }
        let sourceViewController = segue.source as! NoteDetailViewController
        
        if let note = sourceViewController.note {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                DataManagers.notes.data[selectedIndexPath.row] = note
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: DataManagers.notes.data.count, section: 0)
                DataManagers.notes.data.append(note)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNoteDetails" {
            let noteViewController = segue.destination as! NoteDetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedNote = DataManagers.notes.data[indexPath.row]
            noteViewController.note = selectedNote
        }
    }
    
   
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        DataManagers.notes.data.swapAt(fromIndexPath.row, to.row)
        tableView.reloadData()
    }
    
}
