//
//  File.swift
//  PersonalityQuiz
//
//  Created by Student04 on 2019-03-28.
//  Copyright © 2019 Student04. All rights reserved.
//

// Define all of the structures for personality quiz
import Foundation

//QUESTION
struct Question {
    var text: String //text to represent the question
    var type: ResponseType //input method of answers taken from ResponseType enum
    var answers: [Answer] //array of Answer objects
}

//since interface allows use of diff. input methods, can use enum to rep. question response type
enum ResponseType {
    case single, multiple, ranged //types of input values question may use
}

//ANSWER
struct Answer {
    var text: String //string to display to user result from enum
    var type: ItemType //ties the answer to specific type
}

enum ItemType {
    case globe = globePersonalityResult
}

