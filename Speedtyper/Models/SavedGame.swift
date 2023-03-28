//
//  SavedGame.swift
//  Speedtyper
//
//  Created by Philip Andersson on 2023-03-24.
//

import Foundation

class SavedGames: Codable {
    
    static let shared = SavedGames()
    private var highscores: [Game] = []
    
    private enum CodingKeys: String, CodingKey {
            case highscores
        }
    
    init() {
        
        // retrieve highscore list from user defaults on init
        if let data = UserDefaults.standard.data(forKey: "highscores"),
           let decoded = try? JSONDecoder().decode(SavedGames.self, from: data) {
            self.highscores = decoded.highscores
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
        if let encoded = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(encoded, forKey: "highscores")
        }
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.highscores = try container.decode([Game].self, forKey: .highscores)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(highscores, forKey: .highscores)
    }
}
