//
//  resultRps.swift
//  2.6 roshamboBuild
//
//  Created by mairo on 12/03/2022.
//

import UIKit

// MARK: - Shape: String
// The enum "Shape" represents a play or move
enum Shape: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    // This function randomly generates an opponent's play
    static func randomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
} // Thread 1: Fatal error: Unexpectedly found nil while unwrapping an Optional value (some times when pressed Rock, Paper)

// MARK: - ResultsVC: UIViewController
class ResultVC: UIViewController {
    
    // MARK: Outlets
    @IBOutlet private weak var resultLabel: UILabel!
    
    // MARK: Properties
    // When the ResultsVC is initialized a userChoice is passed in and an opponent's play is generated.
    var userChoice: Shape!
    private let opponentChoice: Shape = Shape.randomShape()
    
    // MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    // MARK: UI
    // The displayResult method generates the message for the results of a match.
    private func displayResult() {
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        // Why is an exclamation point necessary? :)
        switch (userChoice!, opponentChoice) { 
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it is a tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "you win with \(matchup)"
        default:
            text = "you lose with \(matchup)"
        }
        
        resultLabel.text = text
    }
    
    // MARK: Actions
    @IBAction private func playAgain() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } // When a view is presented via push, another method should be used. I modified playAgain so it behaves like you need*
        dismiss(animated: true, completion: nil) // only dismisses a view, which means only views presented modally will be dismissed
    }
}

// *Another question from MENTOR HELP: after choosing rock, the button play again works and throws me back to 1st screen. However for paper and scissors there is a back option that works instead. How can I employ button play again for all 3 options?

/*
 10. Intro to Rock Paper Scissors
 In lesson three, we wrote the rock, paper, scissors app and we used three different techniques to present the ResultViewController. One for each of these three options:
    1. for Rock: Code only
    2. for Paper: Storyboard Segue triggered using Code
    3. for Scissors: Triggered Segue attached to the button in Storyboard.
 
 In MakeYourOwnAdventure App, the Segues have all been of this 3rd kind. We have attached the Segues directly to the buttons using a pop-up connections menu in storyboard.
 */

//  10. Intro to Rock Paper Scissors (0:37) POINT QUESTION: What it would take to reproduce the three segues in rock, paper, scissors using a NavigationController instead of modal presentation***?
