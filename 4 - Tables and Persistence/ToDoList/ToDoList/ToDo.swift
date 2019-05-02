
import Foundation

//Using one Model to represent information gathered
struct ToDo {
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    //retrieves items stored and writes to the disc
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(title: "Task One", isComplete: false, dueDate: Date(), notes: "Notes 1")
        let todo2 = ToDo(title: "Task Two", isComplete: false, dueDate: Date(), notes: "Notes 2")
        let todo3 = ToDo(title: "Task Three", isComplete: false, dueDate: Date(), notes: "Notes 3")
        
        return [todo1, todo2, todo3]
    }
    
    
}
