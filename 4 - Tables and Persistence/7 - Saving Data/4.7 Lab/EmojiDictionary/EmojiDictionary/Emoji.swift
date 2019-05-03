
import Foundation


// make struct conform to Codable
struct Emoji: Codable {
    var symbol: String
    var name: String
    var detailDescription: String
    var usage: String
    static var ArchiveURL = documentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")

    //implement saving and loading methods
    static func saveToFile(emojis: [Emoji]) {
        
        let propertyListEncoder = PropertyListEncoder()
        let encodedEmoji = try? propertyListEncoder.encode(emojis)
        
        try? encodedEmoji?.write(to: Emoji.ArchiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Emoji] {
        
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedEmojiData = try? Data(contentsOf: Emoji.ArchiveURL),
            let decodedEmoji = try? propertyListDecoder.decode(Array<[Emoji]>.self, from: retrievedEmojiData) {
       
            return decodedEmoji
            
        }
    }
}

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!


//2) to write data to a file - need a file path

//2) holding the URL that points to the directory, or folder where you can read and write data
//let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!


