//
//  ViewController.swift
//  randomColorGame
//
//  Created by Christian Hurtado on 10/30/19.
//  Copyright © 2019 Christian Hurtado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var playerScore: UILabel!
    
    @IBOutlet weak var highScore: UILabel!
    
    
    
    @IBOutlet weak var redColorButton: UIButton!
    @IBOutlet weak var greenColorButton: UIButton!
    @IBOutlet weak var blueColorButton: UIButton!
    
    var score = 0
    var highScoreInt = 0
    
    var redColor = CGFloat.random(in: 0...1)
    var greenColor = CGFloat.random(in: 0...1)
    var blueColor = CGFloat.random(in: 0...1)
    
    func newColor() -> UIColor {
        redColor = CGFloat.random(in: 0...1)
        greenColor = CGFloat.random(in: 0...1)
        blueColor = CGFloat.random(in: 0...1)
        
        let newColor = UIColor.init(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
        
        return newColor
    }
    
    
    @IBOutlet weak var newGameOutlet: UIButton!
    
    @IBOutlet weak var generatedColor: UIView!
    
    
    
    @IBOutlet weak var rightOrWrong: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func coloredButtons(_ sender: UIButton) {
        var colorArray = [redColor, greenColor, blueColor]
        var highestColor = colorArray.max() ?? 0
        
        switch highestColor {
        case redColor:
            if sender.tag == 0{
                rightOrWrong.text = "⭐️Correct! 🙌🚀⭐️"
                generatedColor.backgroundColor = newColor()
                score += 1
                playerScore.text = "Player Score: \(score)"
                if score > highScoreInt{
                    highScoreInt = score
                    highScore.text = "High Score: \(highScoreInt)"
                }
            }
            else{
                rightOrWrong.text = "😵Wrong!⚰️🖕🏽"
                score = 0
                enableButtons(false)
                playerScore.text = "Player Score: 0"
            }
        case greenColor:
            if sender.tag == 1{
                rightOrWrong.text = "⭐️Correct! 🙌🚀⭐️"
                generatedColor.backgroundColor = newColor()
                score += 1
                playerScore.text = "Player Score: \(score)"
                if score > highScoreInt{
                    highScoreInt = score
                    highScore.text = "High Score: \(highScoreInt)"
                }
            }
            else{
                rightOrWrong.text = "😵Wrong!⚰️🖕🏽"
                score = 0
                playerScore.text = "Player Score: 0"
                enableButtons(false)
                
                
            }
        case blueColor:
            if sender.tag == 2{
                rightOrWrong.text = "⭐️Correct! 🙌🚀⭐️"
                generatedColor.backgroundColor = newColor()
                score += 1
                playerScore.text = "Player Score: \(score)"
                if score > highScoreInt{
                    highScoreInt = score
                    highScore.text = "High Score: \(highScoreInt)"
                }
            }
            else{
                rightOrWrong.text = "😵Wrong!⚰️🖕🏽"
                score = 0
                playerScore.text = "Player Score: 0"
                enableButtons(false)
                
                
            }
        default:
            break
        }
        
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        enableButtons(true)
        generatedColor.backgroundColor = newColor()
        rightOrWrong.text = "Which color is dominant?"
    }
    
    func enableButtons(_ isEnabled: Bool) {
        redColorButton.isEnabled = isEnabled
        greenColorButton.isEnabled = isEnabled
        blueColorButton.isEnabled = isEnabled
        
        if !isEnabled {
            redColorButton.alpha = 0.5
            greenColorButton.alpha = 0.5
            blueColorButton.alpha = 0.5
        } else {
            redColorButton.alpha = 1.0
            greenColorButton.alpha = 1.0
            blueColorButton.alpha = 1.0
        }
    }
}
