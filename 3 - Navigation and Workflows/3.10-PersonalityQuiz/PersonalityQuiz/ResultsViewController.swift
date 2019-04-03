//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Student04 on 2019-03-28.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]! //of Answer type and implicitly unwrapped so tha viewController can be displayed from storyboard even if the property has no value
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult() ///called when results view is able to calculate results
        navigationItem.hidesBackButton = true //user cannot see back button
    }
    //**CALCULATE ANSWER FREQUENCY** - most common personality type for rsOesult
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [itemType: Int] = [:] //dictionary to hold frequency of responses
        let responseTypes = responses.map { $0.type } //Simplified collection: type prop. of Answer by mapping each Answer to corresponding type (takes value from type itemType)
        
        for response in responseTypes { //iterates through collection
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
            //iterates through collection(responseTypes), adding/updating the key/values pairs in frequencyOfAnswers' dictionary (if not nil, value set to response and incremented as 1, otherwise set to default value of 0
        }
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: //Swift sorted(by: ) method
    { (pair1, pair2) -> Bool in //frequencyOfAnswers Dictionary key and values (itemType and Int), //takes any 2 key/value pairs (eg book: 1, globe: 2)
        return pair1.value > pair2.value //return bool to determine which of the pairs is larger. In the case of eg) return 1 > 2, bool is false, so know pair2 is larger than pair1
        
    }) //Same as ?
        let mostCommonAnswer = frequentAnswersSorted.sorted {
            $0.1 > $1.1 }.first!.key //They refer to the first and second arguments of sort. Here, sort compares 2 elements from a dictionary key and value 

        //UPDATE RESULT LABELS
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition //refers to itemType definition for text

    }
    
    
}
