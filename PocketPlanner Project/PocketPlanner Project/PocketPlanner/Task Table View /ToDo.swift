
import Foundation

//Using one Model to represent information gathered
struct ToDo: Codable { //To-do objects can now encoded and decoded
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    var monthDate: Date
    //retrieves items stored and writes to the disc - DECODING
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: ArchiveURL)
            else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    
    static func saveTodos(_ todos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(todos)
        
        try? codedToDos?.write(to: ArchiveURL, options: .noFileProtection)
    }
    
    //to test our display of instances of todos on table view list
    /*static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(title: "Task One", isComplete: false, dueDate: Date(), notes: "Notes 1")
        let todo2 = ToDo(title: "Task Two", isComplete: false, dueDate: Date(), notes: "Notes 2")
        let todo3 = ToDo(title: "Task Three", isComplete: false, dueDate: Date(), notes: "Notes 3")
        
        return [todo1, todo2, todo3]
    }*/
    
    //converts a DateFormatter object into a string - static allows it not to be tied to any specific instance of the model
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    //define the ArchiveURL with proper subfolder string
    static let ArchiveURL = DocumentsDirectoryTo.appendingPathComponent("todos").appendingPathExtension("plist")
}

let DocumentsDirectoryTo = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
