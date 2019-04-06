import UIKit

var str = "Hello, playground"
struct Movie: Codable {
    enum MovieGenere: String, Codable {
        case horror, skifi, comedy, adventure, animation
    }
    
    var name : String
    var moviesGenere : [MovieGenere]
    var rating : Int
}

let upMovie = Movie(name: "Up", moviesGenere: [.comedy , .adventure, .animation], rating : 4)

// Encode data
let jsonEncoder = JSONEncoder()
do {
    let jsonData = try jsonEncoder.encode(upMovie)
    let jsonString = String(data: jsonData, encoding: .utf8)
    print("JSON String : " + jsonString!)
}
catch {
    "name": "Up",
    "moviesGenere": [
    "comedy",
    "adventure",
    "animation"
    ],
    "rating": 4
}


