//
//  PhotoInfo.swift
//  SpacePhoto
//
//  Created by Student04 on 2019-05-14.
//  Copyright © 2019 Student04. All rights reserved.
//

import Foundation

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

