//
//  NewGameViewController.swift
//  Speedtyper
//
//  Created by Philip Andersson on 2023-03-21.
//

import UIKit

class NewGameViewController: UIViewController {
    
    // Install cocoaPods and implement (pod 'SwipeCellKit')
    
    var timer : Timer?
    let defaults = UserDefaults.standard
    
    private var secondsPerWord = 5
    private var score = 0
    private var elapsedTime = 0
    
    private var usedWords : [String] = []
    
    private var randomWord = Words().getRandomWord(ofLength: 5)

    @IBOutlet weak var secondsPerWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var presentWordLabel: UILabel!
    
    @IBOutlet weak var answerTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1,
                repeats: true, block: updateTimer(timer:))
        
        presentWordLabel.text = randomWord
        
        answerTextField.becomeFirstResponder()
    }
    
    @IBAction func answerTextField(_ sender: Any) {
        
        if GameModel().ifAnswerCorrect(answerTextField.text!, (presentWordLabel.text)!) {
//            let newWord = Words().getRandomWord(ofLength: lengthOfWord(score))
            
            let word = GameModel().uniqueRandomWord(score, usedWords)
            answerTextField.text = ""
            presentWordLabel.text = word
            
            usedWords.append(word)
            secondsPerWord = 6
            score += 1
            scoreLabel.text = "\(score) :pts"
        }
    }
    
    func updateTimer(timer : Timer) {
        secondsPerWord -= 1
        elapsedTime += 1
        secondsPerWordLabel.text = String(secondsPerWord)
        elapsedTimeLabel.text = "time: \(formatSeconds(seconds: elapsedTime))"
        
        // gameModel ?
        if secondsPerWord <= 0 || score == 20 {
            let newGame = Game(score: score, time: elapsedTime)
            SavedGames.shared.addHighscore(newGame)
            answerTextField.isEnabled = false
            timer.invalidate()
            
            usedWords.removeAll()
            print("savedGame \nscore: \(newGame.score)\ntime: \(newGame.time)\ndate: \(newGame.date)")
        }
    }
    
    func formatSeconds(seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
