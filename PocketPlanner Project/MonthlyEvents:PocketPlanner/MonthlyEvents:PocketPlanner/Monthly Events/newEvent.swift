//
//  newEvent.swift
//  MonthlyEvents:PocketPlanner
//
//  Created by Student04 on 2019-06-03.
//  Copyright © 2019 Student04. All rights reserved.
//

import Foundation

struct Event {
    var eventTitle: String
    var eventDate: String 
    var startTime: String
    var endTime: String
    var eventDetails: String
    
    static func loadEvents() -> [Event]? {
        return nil
    }
    
   /*static func loadSampleEvents() -> [Event] {
        let event1 = Event(eventTitle: "Work", startTime: "1 pm", endTime: "7 pm", eventDetails: "Come 10 min early")
        let event2 = Event(eventTitle: "School", startTime: "8 am", endTime: "3 pm", eventDetails: "English project due")
        
        return [event1, event2]
        
    }*/
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
  
}

