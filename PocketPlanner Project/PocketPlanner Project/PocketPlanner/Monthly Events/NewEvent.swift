//  newEvent.swift
//  MonthlyEvents:PocketPlanner
//
//  Created by Student04 on 2019-06-03.
//  Copyright © 2019 Student04. All rights reserved.
//

import Foundation

struct Event: Codable {
    var eventTitle: String
    var eventDate: String
    var startTime: String
    var endTime: String
    var eventDetails: String
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    //retrieves items stored and writes to the disc - DECODING
    static func loadEvents() -> [Event]? {
        guard let codedEvents = try? Data(contentsOf: ArchiveURL)
            else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<Event>.self, from: codedEvents)
    }
    
    static func saveEvents(_ events: [Event]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedEvents = try? propertyListEncoder.encode(events)
        try? codedEvents?.write(to: ArchiveURL, options: .noFileProtection)
    }
    
    static let ArchiveURL = DocumentsDirectoryEvents.appendingPathComponent("events").appendingPathExtension("plist")
}

let DocumentsDirectoryEvents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                .appendingPathExtension("plist")
    }()
}

