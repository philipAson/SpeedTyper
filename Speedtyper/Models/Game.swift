//
//  Game.swift
//  Speedtyper
//
//  Created by Philip Andersson on 2023-03-23.
//

import Foundation

struct Game : Equatable {
    
    var score: Int
    var time: Int
    var date: String
    
    // making Game Equatable so we can compare two objects
    static func == (lhs: Game, rhs: Game) -> Bool {
            return lhs.score == rhs.score &&
                lhs.time == rhs.time &&
                lhs.date == rhs.date
        }
    
    init(score: Int, time: Int) {
        self.score = score
        self.time = time
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        self.date = dateFormatter.string(from: Date())
    }
    
    init?(dictionary: [String: Any]) {
        guard let score = dictionary["score"] as? Int,
              let time = dictionary["time"] as? Int,
              let date = dictionary["date"] as? String else {
            return nil
        }
        
        self.score = score
        self.time = time
        self.date = date
    }
    
    var dictionaryRepresentation: [String: Any] {
        return ["score": score, "time": time, "date": date]
    }
}
