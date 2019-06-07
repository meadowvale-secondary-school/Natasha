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
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    
}
