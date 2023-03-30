//
//  SavedGame.swift
//  Speedtyper
//
//  Created by Philip Andersson on 2023-03-24.
//

import Foundation

class SavedGames {
    
    static let shared = SavedGames()
    private var highscores: [Game] = []
   
    
    init() {
        // retrieve highscore list from user defaults on init
        if let data = UserDefaults.standard.array(forKey: "highscores") as? [[String: Any]] {
            highscores = data.compactMap { Game(dictionary: $0) }
        }
    }
    
    // functionality to add a Game to highscore
    func addHighscore(_ game: Game) {
        highscores.append(game)
        saveHighscores()
    }
    
    // returns a sorted list of highscore that is just a list containing [Game]. Closeure compare two games based on their score and time.
    func getHighscores() -> [Game] {
        return highscores.sorted { (game1, game2) -> Bool in
            // if score is equal returns the game that has the least time as first
            if game1.score == game2.score {
                return game1.time < game2.time
                // else returns the game that has the highest score as first
            } else {
                return game1.score > game2.score
            }
        }
    }
    
    private func saveHighscores() {
        let data = highscores.map { $0.dictionaryRepresentation }
        UserDefaults.standard.set(data, forKey: "highscores")
    }
}

