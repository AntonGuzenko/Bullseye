//
//  Game.swift
//  Bullseye
//
//  Created by Anton Guzenko on 10.12.2021.
//

import Foundation

struct Game {
    var target = Int.random(in: 1..<100)
    var score: Int = 0
    var round: Int = 1
    
    func points(sliderValue: Int) ->  Int {
        100 - abs(target - sliderValue)
       
        
    }
    
    mutating func startNewRound(points: Int)  {
        score += points
        round += 1
    }
    
}
