//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Student04 on 2019-04-09.
//

import Foundation

struct Athlete {
    var name: String
    var age: String
    var league: String
    var team: String
    
    //computed prop for phrase:
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)"
    }
}
