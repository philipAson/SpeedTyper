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
    
    func addHighscore(_ game: Game) {
        highscores.append(game)
        saveHighscores()
        
    }
    
    func getHighscores() -> [Game] {
        return highscores.sorted { $0.score > $1.score}
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
