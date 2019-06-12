import UIKit

class NotesTableViewController: UITableViewController {
    
    var notes: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = editButtonItem
        if let savedNotes = Note.loadNotes() {
            notes = savedNotes
        } else {
             notes = [Note]()
            print("unable to fill table view with saved notes")
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell") as? NotesCell else {
            fatalError("Could not deque a cell")
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM d, yyyy"
        //EEEE, MMM d, yyyy
        
        //Get the model out of the array that corresponds to the cell being displayed
        let note = notes[indexPath.row]
        //update the cell's properties accordingly
        cell.titleLabel?.text = note.title
        cell.currentDateLabel?.text = dateFormatter.string(from: note.currentDate)
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
            notes.remove(at: indexPath.row) //delete the model from the array
            tableView.deleteRows(at: [indexPath], with: .fade) //as well as from the table view
            Note.saveNotes(notes) //save when user tries to delete an item*
        }
    }
    
    @IBAction func unwindToToDoList(_ segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! NoteDetailViewController
        
        if let note = sourceViewController.note {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                notes[selectedIndexPath.row] = note
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                
                
                let newIndexPath = IndexPath(row: notes.count, section: 0)
                notes.append(note)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        Note.saveNotes(notes)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let todoViewController = segue.destination as! ToDoViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedTodo = todos[indexPath.row]
            todoViewController.todo = selectedTodo
            
        }
        
        if segue.identifier == "backToHome" {
            ToDo.saveTodos(todos)
        }
    }
    
    func checkmarkTapped(sender: ToDoCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            var todo = todos[indexPath.row]
            todo.isComplete = !todo.isComplete
            todos[indexPath.row] = todo
            tableView.reloadRows(at: [indexPath], with: .automatic)
            ToDo.saveTodos(todos)
        }
    }
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedTodos = todos.remove(at: fromIndexPath.row)
        todos.insert(movedTodos, at: to.row)
        tableView.reloadData()
        
    }
    
    
    
    
    
    
    
    
}
