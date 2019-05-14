//
//  PhotoInfoController.swift
//  SpacePhoto
//
//  Created by Student04 on 2019-05-14.
//  Copyright © 2019 Student04. All rights reserved.
//

import Foundation

//move your networking code to a function - taken from above
func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void)
{
    
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
