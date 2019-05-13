import UIKit

import PlaygroundSupport

//ensures playground runs continously
PlaygroundPage.current.needsIndefiniteExecution

//To make easier to configure url properly, returning URL? based on a [String: String  dictionary ]
extension URL {
    
    func withQueries(_ queries: [String: String]) -> URL? {
        
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

//create a variable to hold a base url for the iTunes Search API
let baseURL = URL(string: "https://itunes.apple.com/search?")!


let query: [String: String] = [
    "term": "Inside Out 2015",
    "media": "movie",
    "lang": "en_us",
    "limit": "10"
]

//create the search URL that will be used to request data from the API
let searchURL = baseURL.withQueries(query)!

//PULLING DATA FROM THE WEB

//use the shared URLSession to create a dataTask for the specified URL
URLSession.shared.dataTask(with: searchURL) { (data, response, error) in
    //the complete handler will give you three properties to work with: Data? URLResponse? and Error? (able to provide approciate names for the placeholder values)
    if let data = data, //if data exisits, unwraps the data received.
        let string = String(data: data, encoding: .utf8) {
        print(string) // Creates a string from the data that will display the data's contents, then print that string to the console
       
        PlaygroundPage.current.finishExecution() //onces youve printed data to the console, playground no longer needs to ocntinue executing, can stop the playground from runninf by adding the following line of code 
    }
    }.resume() //resume the dataTask



