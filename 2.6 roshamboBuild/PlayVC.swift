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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: Generate Dice Value
    // Mac randomly generates 1...3 for Rock, Paper or Scisorrs
    
    func randomRps() -> Int {
        let randomValue = 1 + arc4random() % 3
        return Int(randomValue)
    }
    
    // MARK: Actions
    // Passing Data Between ViewControllers:
    // 1. CODE: no segue (for Rock)
    
    @IBAction func rockPressed() {
        
        // Switch to ResultRPSViewController - note is is the next VC/screen
        
        var controller: ResultVC
        controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as! ResultVC
        
        // Mac to choose random value 1...3
        
        controller.randomValue = randomRps()
        
        // Present the view Controller
        
        present(controller, animated: true, completion: nil)
    }
}

