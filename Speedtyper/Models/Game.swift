//
//  Game.swift
//  Speedtyper
//
//  Created by Philip Andersson on 2023-03-23.
//

import Foundation

struct Game: Codable {
    var score: Int
    var time: Int
    var date: Date
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
    
    init(score: Int, time: Int) {
        self.score = score
        self.time = time
        self.date = Date()
    }
    
    func toDictionary() -> [String: Any] {
        return ["score": score, "time": time, "date": date.timeIntervalSince1970]
    }
    
    static func fromDictionary(_ dict: [String: Any]) -> Game? {
        guard let score = dict["score"] as? Int,
              let time = dict["time"] as? Int,
              let dateInterval = dict["date"] as? TimeInterval else {
            return nil
        }
        var game = Game(score: score, time: time)
        game.date = Date(timeIntervalSince1970: dateInterval)
        return game
    }
}
