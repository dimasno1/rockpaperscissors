//
//  RockPaperScissorsController.swift
//  RockPaperScissors
//
//  Created by Dimasno1 on 02.02.2018.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

class RockPaperScissorsController: UIViewController {
    
    //Buttons outlets
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    let buttonToTableViewOfResults: UIButton = {
        let button = UIButton(frame: CGRect(x: 50, y: 50, width: 75, height: 50))
        button.setTitle("Results", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(showResults), for: .touchUpInside)
        return button
    }()
    
    
    @objc func showResults(){
        let tableController = TableViewController()
        self.present(tableController, animated: true, completion: nil)
        
    }
    
    //Functions for button pressed
    @IBAction func paperChoice(_ sender: UIButton) {
        performSegue(withIdentifier: "paperChoice", sender: self)
    }
    
    @IBAction func rockChoice(){
        var controller: ResultController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultController") as! ResultController
        controller.playerChoice = .rock
        controller.randomValue = randomValue()
        present(controller, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(buttonToTableViewOfResults)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "paperChoice"{
            let controller = segue.destination as! ResultController
            controller.randomValue = randomValue()
            controller.playerChoice = .paper
        }else if segue.identifier == "scissorsChoice"{
            let controller = segue.destination as! ResultController
            controller.randomValue = randomValue()
            controller.playerChoice = .scissors
        }
    }
    
    //MARK: 
    func randomValue() -> Int {
        let random = Int(arc4random_uniform(3))
        return random
    }
    
    
}
