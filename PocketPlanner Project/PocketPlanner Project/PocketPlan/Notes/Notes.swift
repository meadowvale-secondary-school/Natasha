import Foundation

struct Note: Codable, Equatable {
    var title: String
    var notes: String?
    var currentDate: String

    static func loadNotes() -> [Note]? {
        guard let codedNotes = try? Data(contentsOf: ArchiveURL)
            else {return nil}
        
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<Note>.self, from: codedNotes)
    }
    
    static func saveNotes(_ notes: [Note]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedNotes = try? propertyListEncoder.encode(notes)
        
        try? codedNotes?.write(to: ArchiveURL, options: .noFileProtection)
    }
    
    static let ArchiveURL = DocumentsDirectoryNotes.appendingPathComponent("notes").appendingPathExtension("plist")
}

let DocumentsDirectoryNotes = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

