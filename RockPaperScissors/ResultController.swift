//
//  ResultController.swift
//  RockPaperScissors
//
//  Created by Dimasno1 on 02.02.2018.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

class ResultController: UIViewController {
    
    var result: Result?
    var randomValue: Int?
    var playerChoice: Choice!
    var computerChoice: Choice!
    
    let dictionaryOfImages = [
        Result.win : UIImage(named: "win"),
        Result.lose : UIImage(named: "lose"),
        Result.tie : UIImage(named: "tie")
    ]
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func bye(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var opponentResultImageView: UIImageView!
    
    enum Result{
        
        case win, lose, tie
        func description() -> String{
            
            switch self{
            case .win:
                return "You win, it was a nice game!"
            case .lose:
                return "You lose, do you want to try again?"
            case .tie:
                return "Seems like you and phone are equally strong"
            }
        }
    }
    
    private func imageResult(){
        if let randomValue = self.randomValue{
            let imageName = "\(randomValue)"
            let imageForChoice = UIImage(named: imageName)
            opponentResultImageView.image = imageForChoice
            
            switch imageName {
            case "2":
                computerChoice = Choice.scissors
            case "1":
                computerChoice = Choice.rock
            case "0":
                computerChoice = Choice.paper
            default:
                break
            }
        }
        
        switch (playerChoice, computerChoice){
        case let (user, AI) where user == AI:
            result = .tie
            opponentResultImageView.image = UIImage(named: "itsATie")
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            result = .lose
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            result = .win
        default:
            break
        }
        resultLabel.text = result?.description()
    }
    
    enum Choice{
        case paper, rock, scissors
        
        func description() -> String{
            
            switch self{
            case .paper:
                return "Paper"
            case .rock:
                return "Rock"
            case .scissors:
                return "Scissors"
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageResult()
        if result != nil{
            let resultD = ResultSaver(resultDescription: (result?.description())!, imageForResult: dictionaryOfImages[result!]!, yourSign: playerChoice.description(), computerSign: computerChoice.description())
            ResultSaver.arrayOfResult.append(resultD)
        }
        
    }
}
