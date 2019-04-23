import UIKit

//Example 1: Works through encoding an object as Data and writing it to a file

//Since String and Data are types that conform to Codable, no need to explicitly have the two required methods for the protocol - automatically conforms to Codable
struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}

//UPDATED - Writing the Data
//new instance of note that can be encoded
let newNote = Note(title: "Grocery run", text: "Pick up mayonnaise, mustard, lettuce, tomato, and pickles", timestamp: Date())

/*let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

//userDomainMask refers to the user's home folder, that holds the user's apps and all their data

//Request the first result of the search to assign to the variable - holding the URL that points to the directory, or folder where you can read and write data

let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")

let propertyListEncoder = PropertyListEncoder()
let encodedNote = try? propertyListEncoder.encode(newNote)

//can use method on Data to write to that path:
try? encodedNote?.write(to: archiveURL, options: .noFileProtection) //with .noFileProtection, able to overwrite in future if Note object changed and needs to be saved again

//retrieve data from the file, by initalizing a Data object using its throwing initalizer init(contentsOf:), and pass it to the URL which the data is stored, then decode the data"\:
let propertyListDecoder = PropertyListDecoder()
if let retrievedNoteData = try? Data(contentsOf: archiveURL), let decodedNote = try? propertyListDecoder.decode(Note.self, from: retrievedNoteData) {
    print(decodedNote)
}*/

//prints:Note(title: "Grocery run", text: "Pick up mayonnaise, mustard, lettuce, tomato, and pickles", timestamp: 2019-04-22 23:57:13 +0000)


//SAVING AN ARRAY OF MODEL DATA - archive and unarchive collections of model data. For example, your app saving all the user's notes

//UPDATE 3 - using Notes array, then update code to encode the array and write the resulting data to file 
let note1 = Note(title: "Note One", text: "This is a sample note.", timestamp: Date())
let note2 = Note(title: "Note Two", text: "This is another sample note.", timestamp: Date())
let note3 = Note(title: "Note Three", text: "This is yet another sample note.", timestamp: Date())
let notes = [note1, note2, note3]

let documentsDirectory =
    FileManager.default.urls(for: .documentDirectory,
                             in: .userDomainMask).first!
let archiveURL =
    documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
let propertyListEncoder = PropertyListEncoder()
let encodedNotes = try? propertyListEncoder.encode(notes)
try? encodedNotes?.write(to: archiveURL, options: .noFileProtection)
let propertyListDecoder = PropertyListDecoder()
if let retrievedNotesData = try? Data(contentsOf: archiveURL),
    let decodedNotes = try?
        propertyListDecoder.decode(Array<Note>.self, from:
            retrievedNotesData) {
   print(decodedNotes)
}

//Example 1: Works through encoding an object as Data and writing it to a file
//Example of how to use Encoder object to encode a value to a plist (property list for all of model's data)
/*let propertyListEncoder = PropertyListEncoder()
if let encodedNote = try? propertyListEncoder.encode(newNote) {//
    print(encodedNote)
    //PropertyListEncoder's encode() is a throwing function requring either do-try-catch or keywork try?
    //Using try? will simplu return optional Data instead of throwing any errors
    //Prints: "156 bytes" - number of bytes stored in the Data object, encoding newNote
    
    //Does in reverse and uses PropertyListDecoder
    let propertyListDecoder = PropertyListDecoder()
    if let decodedNote = try? propertyListDecoder.decode(Note.self, from: encodedNote) { //decode(_:from: takes parameter Note.self and the note data), lets know the actual swift type of Note instead of specific Note object
        print(decodedNote)
        //prints: Note(title: "Grocery run", text: "Pick up mayonnaise, mustard, lettuce, tomato, and pickles", timestamp: 2019-04-22 23:09:23 +0000)
    }
}//*/

//WRITING DATA TO A FILE
/*
 Sandboxing: Giving programs access to only the resources that they'd created or that they requested specific access to - every app in its own enviroment, but no access outside
 
 As a part of the sandbox model, able to have directiories to save data - one is called Documents directorty, where allowed to save and modify info related to your app
 
 file path - similar to URL, for locating data to the Documents Directory
 
 Foundation Framework - defines a FileManager class for interacting with the files on disk, giving access to the Documents directory, and enables it to read and write files in that directory
 */

//FULL PATH FOR DIRECTORIES - where Note's object's data written to file
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

 */*/
