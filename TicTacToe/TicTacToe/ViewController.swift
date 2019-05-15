//
//  ViewController.swift
//  TicTacToe
//
//  Created by sneakysneak on 30/11/2018.
//  Copyright © 2018 sneakysneak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var labelWinner: UILabel!
    @IBOutlet var buttonPlayAgain: UIButton!
    
    
    @IBAction func playAgain(_ sender: Any) {
        
        activeGame = true
        activePlayer = 1
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        var button: UIButton
        
        for i in 1..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
                
            }
            
            //get rid of labels and play again button during the game
            labelWinner.isHidden = true
            buttonPlayAgain.isHidden = true
            
            labelWinner.center = CGPoint(x: labelWinner.center.x - 500, y: labelWinner.center.y)
            buttonPlayAgain.center = CGPoint(x: buttonPlayAgain.center.x - 500, y: buttonPlayAgain.center.y)
        }
    }
    
    var activeGame = true
    
    var activePlayer = 1
    
    var gameState = [0,0,0,0,0,0,0,0,0] // 0 is empty, 1 is noughts, 2 is crosses
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        //get buttons' tag
        //print(sender.tag)
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = activePlayer
        
        if activePlayer == 1 {
            
            (sender as AnyObject).setImage(UIImage(named: "nought.png"), for: [])
            activePlayer = 2

        } else {
            
            (sender as AnyObject).setImage(UIImage(named: "cross.png"), for: [])
            activePlayer = 1
            
        }
            
            for combination in winningCombinations {
                //Start to check the first element if it's NOT 0, if it is then no win here
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]]
                && gameState[combination[1]] == gameState[combination[2]] {
                    //Then somebody won
                    
                    activeGame = false
                    
                    labelWinner.isHidden = false
                    buttonPlayAgain.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        labelWinner.text = " NOUGHTS WON"
                        
                    } else {
                        
                        labelWinner.text = " CROSSES WON"
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.labelWinner.center = CGPoint(x: self.labelWinner.center.x + 500, y: self.labelWinner.center.y)
                        self.buttonPlayAgain.center = CGPoint(x: self.buttonPlayAgain.center.x + 500, y: self.buttonPlayAgain.center.y)
                    })
                    
//                    print(gameState[combination[0]])
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //get rid of labels and play again button during the game
        labelWinner.isHidden = true
        buttonPlayAgain.isHidden = true
        
        labelWinner.center = CGPoint(x: labelWinner.center.x - 500, y: labelWinner.center.y)
        buttonPlayAgain.center = CGPoint(x: buttonPlayAgain.center.x - 500, y: buttonPlayAgain.center.y)
    }


}

