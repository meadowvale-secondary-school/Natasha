
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
        //if the data exists from the method
        if let retrievedEmojiData = try? Data(contentsOf: Emoji.ArchiveURL),
            //decode the data to be an array of Emojis
            let decodedEmoji = try? propertyListDecoder.decode(Array<Emoji>.self, from: retrievedEmojiData) {
            
            //functions end on when return called - returns data if there is any stored
            return decodedEmoji

        } //presented by defualt 
        return emojis
    }

}

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

var emojis = [Emoji(symbol: "😀", name: "Grinning Face", detailDescription: "A typical smiley face.", usage: "happiness"),
              Emoji(symbol: "😕", name: "Confused Face", detailDescription: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
              Emoji(symbol: "😍", name: "Heart Eyes", detailDescription: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
              Emoji(symbol: "👮", name: "Police Officer", detailDescription: "A police officer wearing a blue cap with a gold badge. He is smiling, and eager to help.", usage: "person of authority"),
              Emoji(symbol: "🐢", name: "Turtle", detailDescription: "A cute turtle.", usage: "Something slow"),
              Emoji(symbol: "🐘", name: "Elephant", detailDescription: "A gray elephant.", usage: "good memory"),
              Emoji(symbol: "🍝", name: "Spaghetti", detailDescription: "A plate of spaghetti.", usage: "spaghetti"),
              Emoji(symbol: "🎲", name: "Die", detailDescription: "A single die.", usage: "taking a risk, chance; game"),
              Emoji(symbol: "⛺️", name: "Tent", detailDescription: "A small tent.", usage: "camping"),
              Emoji(symbol: "📚", name: "Stack of Books", detailDescription: "Three colored books stacked on each other.", usage: "homework, studying"),
              Emoji(symbol: "💔", name: "Broken Heart", detailDescription: "A red, broken heart.", usage: "extreme sadness"),
              Emoji(symbol: "💤", name: "Snore", detailDescription: "Three blue \'z\'s.", usage: "tired, sleepiness"),
              Emoji(symbol: "🏁", name: "Checkered Flag", detailDescription: "A black and white checkered flag.", usage: "completion")]



//2) to write data to a file - need a file path

//2) holding the URL that points to the directory, or folder where you can read and write data
//let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!


