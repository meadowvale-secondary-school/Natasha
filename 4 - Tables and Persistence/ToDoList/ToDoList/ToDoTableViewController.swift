
import UIKit

class ToDoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedToDos = ToDo.loadToDos() {
            todos = savedToDos
        } else {
           ToDo.loadSampleToDos()
        }
        
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier") else {
            fatalError("Could not deque a cell")
        }
        
        //Get the model out of the array that corresponds to the cell being displayed
        let todo = todos[indexPath.row]
    
        //update the cell's properties accordingly
        cell.textLabel?.text = todo.title
        
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
            todos.remove(at: indexPath.row) //delete the model from the array
            tableView.deleteRows(at: [indexPath], with: .fade) //as well as from the table view 
            
        }
    }

    @IBAction func unwindToToDoList(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
        
        
        
    }
    
    
    
    
    


