import UIKit

class ToDoTableViewController: UITableViewController, ToDoCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    var todos = [ToDo]() //table view manages the collection of items - using an array of Todos
    
    //changes based on how many sections there are, in one section just the amount of todos
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    //called whenever cell is about to be displayed on the screen
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //attempt a deque cell, fail if unsucessful
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier") as? ToDoCell else {
            fatalError("Could not deque a cell")
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        //EEEE, MMM d, yyyy
        
        let monthDateFormatter = DateFormatter()
        monthDateFormatter.dateFormat = "MMM d"

        
        cell.delegate = self
        //Get the model out of the array that corresponds to the cell being displayed
        let todo = todos[indexPath.row]
        //update the cell's properties accordingly
        cell.titleLabel?.text = todo.title
        cell.isCompleteButton.isSelected = todo.isComplete
        cell.weekdayDisplay?.text = dateFormatter.string(from: todo.dueDate)
        cell.taskDetails?.text = todo.notes
        
        //return the cell from the method
        cell.dateMonthDisplay?.text = monthDateFormatter.string(from: todo.monthDate)
        
        return cell
        
    }
    
    //choose which cells are editable
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //When the cell is swiped, a red delete button app
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete { //verify the Delete button triggered the method call
            todos.remove(at: indexPath.row) //delete the model from the array
            tableView.deleteRows(at: [indexPath], with: .fade) //as well as from the table view
            ToDo.saveTodos(todos) //save when user tries to delete an item*
        }
    }
    
    //displaying new Todos into the Table View Controller rows
    @IBAction func unwindToToDoList(_ segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return } //verify save unwind is being called
        let sourceViewController = segue.source as! ToDoViewController //sets to form view as source
        
        if let todo = sourceViewController.todo {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                todos[selectedIndexPath.row] = todo
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                
                //add a new todo of the todos array, creating an index path based on how many items are in the array already (if 0, then adds to row 1)
                
                let newIndexPath = IndexPath(row: todos.count, section: 0)
                todos.append(todo)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        ToDo.saveTodos(todos) //save data whenever save button pressed
    }
    
    //allows you to select and edit details for the selected todo on todo list, making the static reappear with the same data (need to update)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let todoViewController = segue.destination as! ToDoViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedTodo = todos[indexPath.row]
            todoViewController.todo = selectedTodo
            
        }
        
        if segue.identifier == "backToHome" {
            ToDo.saveTodos(todos) //save data whenever save button pressed
        }
    }
    
    //calling to do cell delegate method
    func checkmarkTapped(sender: ToDoCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            var todo = todos[indexPath.row]
            todo.isComplete = !todo.isComplete
            todos[indexPath.row] = todo
            tableView.reloadRows(at: [indexPath], with: .automatic)
            ToDo.saveTodos(todos)
        }
    }








}
