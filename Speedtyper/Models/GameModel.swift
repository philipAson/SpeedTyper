//
//  GameModel.swift
//  Speedtyper
//
//  Created by Philip Andersson on 2023-03-21.
//

import Foundation

class GameModel {
    
//    private var timer : Timer?
//    private var secondsPerWord = 6
//    private var score = 0
//    private var elapsedTime = 0
//    private var randomWord = Words().getRandomWord(ofLength: 5)
    
    // starts timer and there by the game
//    func startGame() {
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: updateTimer)
//    }
    
    func ifAnswerCorrect (_ answer : String,_ question : String) -> Bool {
        if answer == question {
            return true
        } else { return false}
        
    }
    
    // triggers functions and events that will occur each increment of timer
//    func updateTimer(timer : Timer) {
//
//        secondsPerWord -= 1
//        elapsedTime += 1
//
//    }
    
    // returns a value which will set the length of random word based on the score
    func lengthOfWord (_ score : Int) -> Int {
        
        if score >= 16 {
            return 20
        } else if score >= 12 {
            return 17
        } else if score >= 8 {
            return 12
        } else if score >= 4 {
            return 8
        } else { return 5}
    }
    
    // returns a word based on lengthOfWord
    func uniqueRandomWord (_ score : Int,_ used: [String]) -> String {
        var word = Words().getRandomWord(ofLength: lengthOfWord(score))
        
        while used.contains(word!) {
            word = Words().getRandomWord(ofLength: lengthOfWord(score))
        }
        
        guard let wordString = word else {
            fatalError("Unexpected word type: \(type(of: word))")
        }
        return wordString
    }
    
    func gameOver (_ secPerWord: Int, _ score: Int) -> Bool {
        return secPerWord <= 0 || score == 20
    }
    
}
