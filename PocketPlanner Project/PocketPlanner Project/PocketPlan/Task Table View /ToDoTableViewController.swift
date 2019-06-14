import UIKit

class ToDoTableViewController: UITableViewController, ToDoCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    //= []   // var todos = [ToDo]() //table view manages the collection of items - using an array of Todos
    
    //changes based on how many sections there are, in one section just the amount of todos
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManagers.todos.data.count
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
        let todo = DataManagers.todos.data[indexPath.row]
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
            DataManagers.todos.data.remove(at: indexPath.row) //delete the model from the array
            tableView.deleteRows(at: [indexPath], with: .fade) //as well as from the table view
        }
    }
    
    @IBAction func unwindToToDoList(_ segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! ToDoViewController
        
        if let todo = sourceViewController.todo {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                DataManagers.todos.data[selectedIndexPath.row] = todo
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                
                
                let newIndexPath = IndexPath(row: DataManagers.todos.data.count, section: 0)
                DataManagers.todos.data.append(todo)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let todoViewController = segue.destination as! ToDoViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedTodo = DataManagers.todos.data[indexPath.row]
            todoViewController.todo = selectedTodo
            
        }
    }
    
    func checkmarkTapped(sender: ToDoCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            var todo = DataManagers.todos.data[indexPath.row]
            todo.isComplete = !todo.isComplete
            DataManagers.todos.data[indexPath.row] = todo
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        DataManagers.todos.data.swapAt(fromIndexPath.row, to.row)
        tableView.reloadData()
        
    }








}
