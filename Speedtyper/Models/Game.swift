//
//  Game.swift
//  Speedtyper
//
//  Created by Philip Andersson on 2023-03-23.
//

import Foundation

// making game codable since Date is a complex data type that cannot be
// directly represented as a simple sequence of bytes and thereby stored in
// userdefaults.
struct Game: Codable {
    var score: Int
    var time: Int
    var date: Date
    
    // implemented to present date in suitable formatt
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
}
