import UIKit
import PlaygroundSupport
//how to create a URL object

//let url = URL(string: "https://www.apple.com")! //! since certain charatcers allowed, if fails, able to change the URL

//in charfe of managing all the network requests you send, and allows you to run code when each request is finished
/*let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data {
        print(data)
    }
}*/
//Send the Request - resumes the task in the playground

/*let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data,
        let string = String(data: data, encoding: .utf8) {
        print(string)
    }
}*/

//A queue is a line of instructions that the processor will execute in order
//processors are capable of switching rapidly between multiple threads, also known as mutliprocessing

//In Xcode - able to use Asynchronous code running on seperate queue on the processor - all session data taks are executed on  abakcground queue, the main queue can continue updating the user interface and responding to user input, while the background queue waits for the respose to your etwork requests

//handling the network requests in playgrounds
PlaygroundPage.current.needsIndefiniteExecution = true

//process the response

//API Basics - create a first request to the APOD API, updating the URL in your network request to match the sample query in the documentation - following uses demo API key
let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!
let task = URLSession.shared.dataTask(with: url) {
    (data, response, error) in
    
    if let data = data,
        let string = String(data: data, encoding: .utf8) {
        print(string)
    }
}

//OPTIONAL...
//Modify a URL with URL componenets - helps you parse. read, and create all difeerent parts of a URL in a safe accurate way
//you'll often have the exact string you need to build a URL, but when you are not able to include empty space characters, there is awork around. - Can use a special format called percent-encoding which represents certain characters with the percent sign (%), followed by a number eg %20


//can add any queries to a URL just by passing the queries in a [String:String] dictionary
extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
        }
    }

let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!

let query: [String: String] = [
    "api_key": "DEMO_KEY",
    "date": "2011-07-13"
]

let url2 = baseURL.withQueries(query)!
let task2 = URLSession.shared.dataTask(with: url) {
    (data,response, error) in
    
    if let data = data, let string = String(data: data, encoding: .utf8) {
        print(string)
    }
}
task.resume() //method called on the task in order to send the request
