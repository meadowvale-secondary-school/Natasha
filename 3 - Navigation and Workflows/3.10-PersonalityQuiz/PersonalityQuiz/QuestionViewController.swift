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
    
    //multiple stack switches
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    
    //RANGE STACK
    @IBOutlet weak var rangeStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var rangedSlider: UISlider!
    
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
        //set to questions for instances of Question with property of answer
        let totalProgress = Float(questionIndex) / Float(questions.count) //calcuate percentage progress by dividing questionIndex by total number of questions

        
        navigationItem.title = "Question #\(questionIndex+1)" //Displays in nav bar, with question correspoinding to index number
        questionLabel.text = currentQuestion.text //refers to answers property text, question titles
        questionProgressView.setProgress(totalProgress, animated: true) //UIProgressView Initalizer for setProgress function for float parameter (between 0.0 and 1.0) and animation parameter
        
        
        switch currentQuestion.type { //refers to questionIndex for current Q's # and refering to type of question
        case .single:
            updatesSingleStack(using: currentAnswers) //refers to corresponding stack methods to update titles calling "update...Stack" functions
        case .multiple:
            updatesMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }

    
   //***QUESTION OPTION STACK VIEWS*** - each button/label corresponds to an answer title when question appears in corresponding methods
    func updatesSingleStack(using answers: [Answer]) { //takes Answer collection of initalization
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal) //(set to .normal when neither selected or highlighted.
        singleButton2.setTitle(answers[1].text, for: .normal) //set to Answer strings corresponding to each Answer (1-4) text property
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    //MULTI-ANSWER RESPONSE
    func updatesMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text //takes Answers property of text from collection 
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    //RANGED ANSWER RESPONSE
    func updateRangedStack(using answers: [Answer]){
        rangeStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text //if collection is empty, set to nil
        rangedLabel2.text = answers.last?.text //no matter the amount of answers in ranged response, first and last prop. allow safe access of two Answer structs corresponding to labels
    }
    //**RETRIEVE ANSWERS WITH ACTIONS** - record the player's answers, move to next question, once all questions presented, move onto answer screen
    
    var answerChosen: [Answer] = [] //stores the player's answer in a collection
    
    //When one of the singleButtons are pressed:
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        switch sender { //checks which UIbutton corresponds
        case singleButton1: ///singleButton1 chosen, equates to first answer selected
            answerChosen.append(currentAnswers[0])
        case singleButton2:
            answerChosen.append(currentAnswers[1])
        case singleButton3:
            answerChosen.append(currentAnswers[2])
        case singleButton4:
            answerChosen.append(currentAnswers[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    //When one or more multiple answer buttons are pressed:
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        //with if statements, able to append as many as 4 answers
        if multiSwitch1.isOn {
            answerChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answerChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answerChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answerChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    //When ranged answer are selected, within range value for each
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        //convert slider value to array's index using equation, rounded to nearest integer (index value)
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1))) //set to int type in order to append in currentAnswers index
        answerChosen.append(currentAnswers[index]) //appends caluated index integer using rangeSlider value
        nextQuestion()
    }
    //***RESPOND TO ANSWERED QUESTIONS***
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count { //if the amount of questions answered is less than the amount of questions stored in Question, can continue to call to update the title and the proper stack view (method will use the new value of questionIndex to display next q)
            updateUI()
            
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil) //once all the questions have been completed, the segue between the questions and results view controller can take place
        }
    }
    //**CALCULATE AND DISPLAY RESULTS**
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" { //ensures segue is between ResultsSegue
            let resultsViewController = segue.destination as! ResultsViewController
            //downcast the destination property from UIViewController to ResultsViewController to access responses property
            resultsViewController.responses = answerChosen
        }
    }
    
}
