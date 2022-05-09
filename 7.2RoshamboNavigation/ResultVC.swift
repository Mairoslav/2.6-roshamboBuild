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
        dismiss(animated: true, completion: nil)
    }
}
