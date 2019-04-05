//
//  ViewController.swift
//  PersonalityQuiz
//
//  Created by Student04 on 2019-03-26.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //Done button returns user's view to beginining
    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {
        //since no info from  ResultsViewController needs to be maintained, able to leave method empty
    }
}
