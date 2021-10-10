//
//  ViewController.swift
//  Quiz
//
//  Created by Luka Zecevic on 9.10.21..
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        
        updateUI()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        if quizBrain.checkAnswer(answer: userAnswer) {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.updateQuestionNumber()
        updateUI()
    }
    
    func updateUI(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
        }
        progressView.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()
    }
    
    
    
}

