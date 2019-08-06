//
//  ViewController.swift
//  Sample of TextTwist
//
//  Created by Michelle Cueva on 8/6/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // we don't use an instance of wordData because allInfo is a static property so we do not need this --> let wordData = WordData()
    
    // now to give a random TextTwistInfo to this variable we go to the model and make a function that does this for us there
    
    var currentGame: TestTwistInfo? {
        didSet {
            showAvailableLettersLabel.text = self.currentGame?.letters
        }
    } // don't instantiate it because i want to assign it when view loads
    
    @IBOutlet weak var inputTextField: UITextField!
    
    
    @IBOutlet weak var userGuessMessageLabel: UILabel!
    
    
    @IBOutlet weak var showAvailableLettersLabel: UILabel!
    
    @IBOutlet weak var threeLettersTextView: UITextView!
    
    @IBOutlet weak var fourLettersTextView: UITextView!
    
    @IBOutlet weak var fiveLettersTextView: UITextView!
    
    
    @IBOutlet weak var sixLettersTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentGame = pickNewGame()
        
    
        inputTextField.delegate = self
        // Do any additional setup after loading the view.
    }
// function below for anything using our view control as a delegate it should do whatever is in this function when user hits enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // we are going to see if the guess is correct -> look at textfield.text
        //base on if its correct or not
        
        // here we check if currentGame.words.contains(textField.text)
        
        // if true- message correct
        // add to appropriate text view
        
        // how to determin which text view to put it in check word.count (see how many wordsand add or append )
        // if the guess is incorrect, dont apdate text view with guess , do update the label - correct guess
        
        if let inputText = inputTextField.text {
            let result = currentGame?.verifyGuess(guess: inputText) ?? false
            if result {
                userGuessMessageLabel.text = "Correct"
                AddAnswerToTextView(answer: inputText)
                // Add answer to textfield
            } else {
                userGuessMessageLabel.text = "Incorrect"
            }
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let arrayletters = Array(currentGame?.letters ?? "")//
        
        //if the last letter typed is not in the arrayLetters , the letter should not appear
        
        print(arrayletters)
        
        
            if arrayletters.contains(Character(string)) || string == "" {// this says only run this if the last letter matches a letter in the array or if the last letter is an empty string. If you backspace then it tries to replace the last character with an empty string 
                return true
            } else {
                print("Cannot use the letter \(string)")
                return false
            }
        
    }
    
    
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        print(textField.text)
//    }// this gets called when you resign being the first responder
//    // if you want to check what the function does you can put a print statement to see what happens or when it happens
    
    private func pickNewGame() -> TestTwistInfo {
        return WordData.getGameInfo() // because we made sure that we get a textTwistInfo back in the model we don't have the optional problem here 
    }
    
    // this function goes here instead of the model because it will be directly applied to the view
    
    func AddAnswerToTextView(answer: String) {
        
        switch answer.count {
        case 3:
            threeLettersTextView.text.append("\(answer) \n")
        case 4:
            fourLettersTextView.text.append("\(answer) \n")
        case 5:
            fiveLettersTextView.text.append("\(answer) \n")
        case 6:
            fiveLettersTextView.text.append("\(answer) \n")
        default:
            print("this shouldn't run")// need a default but this shouldn't run
        }
    }

}

