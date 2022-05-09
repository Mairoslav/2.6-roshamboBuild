//
//  ViewController.swift
//  2.6 roshamboBuild
//
//  Created by mairo on 12/03/2022.
//

import UIKit

// MARK: PlayRpsController: UIViewController

class PlayVC: UIViewController {
 
    // MARK: Life Cycle
    // why not used?
   
    // MARK: Programmatic Approach
    @IBAction private func playRock(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as! ResultVC
        vc.userChoice = getUserShape(sender)
        present(vc, animated: true, completion: nil)
    }
    
    // MARK: Segue + Code Approach
    @IBAction private func playPaper(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    // MARK: for scissors purely Triggered Segue attached to the button in Storyboard i.e. no code
    
    // MARK: Segue (any from 3 types)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            let vc = segue.destination as! ResultVC
            vc.userChoice = getUserShape(sender as! UIButton)
        }
    } // ResultVC does not appear
    
    // MARK: utitilies ~ get user's shape
    // The enum "Shape" represents a play or move
    private func getUserShape(_ sender: UIButton) -> Shape {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.title(for: UIControl.State())! // *
        return Shape(rawValue: shape)!
    }
}

// *Unexpectedly found nil while unwrapping an Optional value
