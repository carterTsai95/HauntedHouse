import UIKit

import PlaygroundSupport

let v = UIViewController()

PlaygroundPage.current.liveView = v

//START YOUR CODE FROM HERE

// Declare the INDEX to record the user progress.
var currentStoryIndex = 0

// Step 1. We need some list to save the senoorio for the user.
let scenarios = ["Someone shouts for help in an old house. Do you want to open the door?",
                 "You are in the house. Do you take the stairs?",
                 "Suddenly a spirit attacks! Do you run?",
                 "It turns out the spirit just wanted to say hello. Do you accept?"]

// In the future can use the class or structure to re-write the code.
let correctOptions = [true, false, false, true]

//This going the responsible for the nexr scenario's message
func nextChoice() {
    
    currentStoryIndex += 1
    
    if currentStoryIndex == scenarios.count {
        
        gameWon()
        
        return
    }
    
    let scenarioMessage = scenarios[currentStoryIndex]
    
    let correctOption = correctOptions[currentStoryIndex]
    
    showOption(message: scenarioMessage, correctOption: correctOption)
}

//
func gameWon(){
    showAlert(title: "You won!", message: "You become friends with the spirit.")
}

//
func gameOver()
{
    showAlert(title: "You lose", message: "You make the wrong decision")
}


//
func showAlert(title: String, message: String) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
        
        alert.dismiss(animated: true, completion: nil)
        
    }
    
    alert.addAction(okAction)
    
    v.present(alert, animated: true, completion: nil)
    
}

func showOption(message: String, correctOption: Bool) {
    
    let alert = UIAlertController(title: "Choose a Path", message: message, preferredStyle: .alert)
    
    let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) in
        
        alert.dismiss(animated: true, completion: nil)
        
        if correctOption == true {
            
            nextChoice()
            
        }
        else {
            
            gameOver()
            
        }
        
    }
    
    let noAction = UIAlertAction(title: "No", style: .default) { (action) in
        
        alert.dismiss(animated: true, completion: nil)
        
        if correctOption == false {
            
            nextChoice()
            
        }
        else {
            
            gameOver()
            
        }
        
    }
    
    alert.addAction(yesAction)
    
    alert.addAction(noAction)
    
    v.present(alert, animated: true, completion: nil)
    
}
let scenarioMessage = scenarios[currentStoryIndex]

let correctOption = correctOptions[currentStoryIndex]

showOption(message: scenarioMessage, correctOption: correctOption)

