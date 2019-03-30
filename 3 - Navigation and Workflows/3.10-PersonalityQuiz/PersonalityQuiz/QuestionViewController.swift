//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Student04 on 2019-03-28.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    //***OUTLETS*** (update button and labels)
    @IBOutlet weak var questionLabel: UILabel! //main label at top of Questions view
    
    //change the visiblity of the stacks/question types
    //SINGLE STACK
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    //MULTIPLE STACK
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    //RANGE STACK
    @IBOutlet weak var rangeStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
  
    var questionIndex = 0   //var to keep track of questions displayed using integer value of collection (Starts at 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()//called before each question (VIEW) for title and visiblity of stack
    }
    func updateUI() {
        singleStackView.isHidden = true //set to hidden immediately
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
        
        //CURRENT QUESTIONS AND ANSWERS
        let currentQuestion = questions[questionIndex]
        //currentQuestion is set to questions collection, with Index number chosen based on int value
        let currentAnswers = currentQuestion.answers
        //set to questions for instances of Question with property of Answers
        let totalProgress = Float(questionIndex) / Float(questions.count) //calcuate percentage progress by dividing questionIndex by total number of questions

        
        navigationItem.title = "Question #\(questionIndex+1)" //Displays in nav bar, with question correspoinding to index number
        questionLabel.text = currentQuestion.text //refers to answers property text, question titles
        questionProgressView.setProgress(totalProgress, animated: true) //UIProgressView Initalizer for setProgress function for float parameter (between 0.0 and 1.0) and animation parameter
        
        
        switch currentQuestion.type { //refers to questionIndex for current Q's #
        case .single:
            singleStackView.isHidden = false //#1
        case .multiple:
            multipleStackView.isHidden = false
        case .ranged:
            rangeStackView.isHidden = false
        }
    }

    
    
    
    
    
}
