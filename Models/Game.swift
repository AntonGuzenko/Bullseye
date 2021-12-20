//
//  Game.swift
//  Bullseye
//
//  Created by Anton Guzenko on 10.12.2021.
//

import Foundation
struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1..<100)
    var score: Int = 0
    var round: Int = 1
    var leadersboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            leadersboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leadersboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
            leadersboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
            leadersboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
            leadersboardEntries.append(LeaderboardEntry(score: 20, date: Date()))
        }
    }
    
    func points(sliderValue: Int) ->  Int {
        let difference = abs(target - sliderValue)
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
       return 100 - difference + bonus
    }
    
    mutating func addToLeaderboard(point:Int) {
        leadersboardEntries.append(LeaderboardEntry(score: point, date: Date()))
        leadersboardEntries.sort {$0.score > $1.score}
    }
    
    mutating func startNewRound(points: Int)  {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        addToLeaderboard(point: points)
    }
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
    
}

