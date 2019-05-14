import UIKit

//many web services return data in the JavScript Object Notation (JSON) format
//JSON - The way objects are stored and structured in JavaScript, a popular language for building web services. JSON is the de facto format for passing information around the web

//JSON Basics

//very simliar to working with basic Swift types, eg a Person object
/*{
    "name": "Daren Estrada", //key and pair value
    "favorite_movie": {
        "title": "Finding Dory",
        "release_year": "2016"
    }
}*/

/*{ //array of objects in JSON
    "movies": [
    { //the type of array: [[String: String]]
        "title": "Finding Dory",
        "release_year": "2016"
    
    },
    {
        "title": "Inside Out",
        "release_year": "2015"
        }

    ]
}*/

//Decoding into Swift Types

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self,
                                       resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

//Decoding into Custom Model Objects
//cand represent each type of property for a model object

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String? //sometimes includes copyright or not in network request
    
    //Intitalize Model Objects Using Codable
    //the JSONDecoder an be used to translate info from JSON into your custom model objects
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explaination" //if the propert name and the key name differ, need to assign an associates String to the case where the value is the same
        case url
        case copyright
    }
    
    //ignores the extraneous key/value pairs in the data that PhotoInfo will not include
    init(from decoder: Decoder) throws { //throws indicates a throwing function - not called directly, but by the Decoder used to decode your JSPON data
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
        self.copyright = try? valueContainer.decode(String.self, forKey: CodingKeys.copyright)
    }
}

//Update the Request Completion Handler

//convert JSON data to swift types

//by pairing a throwing function with the do try catch syntax can capture and addres specificn error that the method encounters

//code below will access the NASA APOD API, check for a response, convert to a string and print the string
/*let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
let query: [String: String] = [
    "api_key": "DEMO_KEY",
]
let url = baseURL.withQueries(query)!
let task = URLSession.shared.dataTask(with: url) { (data,
    response, error) in
    let jsonDecoder = JSONDecoder() //decodes daya returned to you from the API into a dictionart [String: String]
    if let data = data, //with try? the function will return an optional value - if there's no error, the optional will hold the expected value, if there is an error, the optional will be nil.
        let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
        print(photoInfo) //String conforms to Codable, so JSONDecoder has a mapping that it can follow to convert from a JSON with string keys and string values to a Swift dictionary with keys of type String and values of type String
    }
}
task.resume()*/

//Where to put code in Xcode - into a PhotoInfo.swift file, if having url extension, put in a URL+Helpers.swfit file
//For networking code: The right place might be a view controller that will display the data, or a model controller type for fetching and mmanagin the model data


//move your networking code to a function - taken from above
func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    let query: [String: String] = [
        "api_key": "DEMO_KEY",
    ]
    
    let url = baseURL.withQueries(query)!
    let task = URLSession.shared.dataTask(with: url) { (data,
        response, error) in
        let jsonDecoder = JSONDecoder() //decodes daya returned to you from the API into a dictionart [String: String]
        if let data = data, //with try? the function will return an optional value - if there's no error, the optional will hold the expected value, if there is an error, the optional will be nil.
            let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
            
            completion(photoInfo) //String conforms to Codable, so JSONDecoder has a mapping that it can follow to convert from a JSON with string keys and string values to a Swift dictionary with keys of type String and values of type String
        } else {
            print("Either no data was returned, or data was not properly decoded.")
            completion(nil)
        }
    }
    task.resume()
}


//write a completion handler
//When you create a network request, you add a completion handler, to the URLSession instance, when thr network request is completed, the URLSession instance eecutes your block of code

/*func performLongRunningOperation(completion: @escaping () -> Void) {
    //Code that performs a long runnning operation
    
    completion() //excutesc code passed in the completion parameter, with @escaping to tell it to do so after the funtion has returned
}*/

fetchPhotoInfo { (fetchedInfo) in
    print(fetchedInfo)
}
