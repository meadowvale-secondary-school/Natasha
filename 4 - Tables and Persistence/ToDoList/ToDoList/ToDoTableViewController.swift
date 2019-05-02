
import UIKit

class ToDoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedToDos = ToDo.loadToDos() {
            todos = savedToDos
        } else {
           ToDo.loadSampleToDos()
        }
        
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
    
    
    
    
    
    
    
}

