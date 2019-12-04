//
//  ViewController.swift
//  CompletedSnake
//
//  Created by Edward O'Neill on 12/2/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var board: [UILabel]!
    
    var pixelArray = [UILabel]()
    var number = 0
    var count = 2
    var pixelNumber = 0
    var gameTimer: Timer?
    var conditionNumber = 0
    var funNumber = 69
    override func viewDidLoad() {
        super.viewDidLoad()
        pixelArray = board.sorted(by: { $0.tag > $1.tag })
        while pixelArray.count < 69 {
            for pixel in board {
                if pixel.tag == pixelNumber {
                    pixel.layer.cornerRadius = 4
                    pixelArray.append(pixel)
                    pixelNumber += 1
                    print("hello")
                }
            }
        }
        gameTimer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    @objc func onTimerFires() {
        if number <= 69 && count % 2 == 0 {
            pixelArray[number].backgroundColor = .green
            pixelArray[funNumber].backgroundColor = .blue
            funNumber -= 1
            number += 1
            conditionNumber += 1
        } else if conditionNumber < 0 && count % 2 == 1  {
            number -= 1
            funNumber += 1
            pixelArray[number].backgroundColor = .black
            pixelArray[funNumber].backgroundColor = .gray
            conditionNumber += 1
        } else {
            conditionNumber = -70
            count += 1
            
        }
        print(number)
//        if number == 70 {
//            gameTimer?.invalidate()
//        }
    }
    
    
}

