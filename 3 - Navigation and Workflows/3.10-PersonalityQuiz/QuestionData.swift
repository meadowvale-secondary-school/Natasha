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
    var type: itemType //ties the answer to specific type
}


enum itemType: Character {
    case book = "📚", globe = "🌎",beaker = "🧪", bell = "🛎"
    
    var definition: String { //property presents as a label on the results screen
        switch self { //used for enum "itemType"
        case .book:
            return "You are the kind of learner that always reaches for the book--or Google, in order to satisfy your questions and curiousity. You have random facts stored in your head from all that you've read, which certainly comes in handy for trivia night!"
        case .globe:
            return "You are a learner through experience. You much rather gain insight from those who are more experienced, and likes to see things from others' perspective. Travelling around the world would be a dream for this kind of learner!"
            
        case .beaker:
            return "You are a scientist, in the sense that you learn by trial and error. You test out new things, and are not afraid to make mistakes. A lot times, the things that you learn are by accident, or are the 'biproduct' of your curiousity!"
            
        case .bell:
            return "You are the kind of learner you likes to learn things as the come. When opportunities arise, you're curiousity is 'rung' by asking questions and sharing your response. You like to work with others in order to develop your understanding, and thrive in group discussions!"
            
        }
        
    }
}
//Any Question you create stored in collection from Question and Answer structures as instancees
var questions: [Question] = [
    Question(text: "What is your favorite kind of drink?", type: .single, answers: [
        Answer(text: "Tea", type: .book), //answer Structure from within "answers" array type
        Answer(text: "Coffee", type: .globe),
        Answer(text: "Kombucha", type: .beaker),
        Answer(text: "Chocolate Milk", type: .bell)
        ]), //instance of Question, with answer's array type
    Question(text: "Which activities do you like?", type: .multiple, answers: [
        Answer(text: "Reading", type: .book),
        Answer(text: "Travelling", type: .globe),
        Answer(text: "Puzzles", type: .beaker),
        Answer(text: "Board Games", type: .bell)
        ]),
    Question(text: "How much do you enjoy podcasts?", type: .ranged, answers: [
        Answer(text: "I dislike them", type: .book),
        Answer(text: "They're ok sometimes", type: .beaker),
        Answer(text: "I like to listen to them", type: .bell),
        Answer(text: "I can listen all day to them!", type: .globe)
        ])
    
]



