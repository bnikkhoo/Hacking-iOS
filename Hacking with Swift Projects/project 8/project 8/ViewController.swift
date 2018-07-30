//
//  ViewController.swift
//  project 8
//
//  Created by Babak Nikkhoo on 11/4/17.
//  Copyright © 2017 Babak Nikkhoo. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    @IBOutlet weak var cluesLabel: UILabel!
    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var currentAnswer: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBAction func submitTapped(_ sender: Any) {
        if let solutionPosition = solutions.index(of: currentAnswer.text!) {
            activatedButtons.removeAll()
            var splitAnswers = answersLabel.text!.components(separatedBy: "\n")
            splitAnswers[solutionPosition] = currentAnswer.text!
            answersLabel.text = splitAnswers.joined(separator: "\n")
            currentAnswer.text = ""
            score += 1
            correctCount += 1
            if correctCount == 7 {
                if level < maxLevel {
                    popup(title: "Well done!", message: "Are you ready for the next level?", button: "Let's go!")
                } else { popup(title: "You beat the game!", message: "Want to start over?", button: "Let's go!") }
                levelUp()
            }
        } else {
            score -= 1
            popup(title: "Wrong!", message: "You lost a point!", button: "Try again!")
            currentAnswer.text = ""
            for btn in activatedButtons { btn.isHidden = false }
            activatedButtons.removeAll()
        }
    }
    @IBAction func clearTapped(_ sender: Any) {
        currentAnswer.text = ""
        for btn in activatedButtons { btn.isHidden = false }
        activatedButtons.removeAll()
    }
    @objc func letterTapped(btn: UIButton) {
        currentAnswer.text = currentAnswer.text! + btn.titleLabel!.text!
        activatedButtons.append(btn)
        btn.isHidden = true
    }
    
    var letterButtons = [UIButton](), activatedButtons = [UIButton](), solutions = [String](), maxLevel = 2, correctCount = 0
    var score = 0 { didSet { scoreLabel.text = "Score: \(score)" } }
    var level = 1 { didSet { levelLabel.text = "Level: \(level)" } }
    
    func popup(title: String, message: String, button: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: button, style: .default))
        present(ac, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for subview in view.subviews where subview.tag == 1001 {
            let btn = subview as! UIButton
            letterButtons.append(btn)
            btn.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
        }
        loadLevel()
    }
    
    func loadLevel() {
        var clueString = "", solutionString = "", letterBits = [String]()
        if let levelFilePath = Bundle.main.path(forResource: "level\(level)", ofType: "txt") {
            if let levelContents = try? String(contentsOfFile: levelFilePath) {
                var lines = levelContents.components(separatedBy: "\n")
                lines = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: lines) as! [String]
                for (index, line) in lines.enumerated() {
                    let parts = line.components(separatedBy: ": ")
                    let answer = parts[0]
                    let clue = parts[1]
                    clueString += "\(index + 1). \(clue)\n"
                    let solutionWord = answer.replacingOccurrences(of: "|", with: "")
                    solutionString += "\(solutionWord.count) letters\n"
                    solutions.append(solutionWord)
                    let bits = answer.components(separatedBy: "|")
                    letterBits += bits
                }
            }
        }
        cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
        answersLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
        letterBits = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: letterBits) as! [String]
        if letterBits.count == letterButtons.count {
            for i in 0 ..< letterBits.count {
                letterButtons[i].setTitle(letterBits[i], for: .normal)
            }
        }
    }
    
    func levelUp() {
        if level < maxLevel {
            level += 1
        } else { level = 1 }
        correctCount = 0
        solutions.removeAll(keepingCapacity: true)
        loadLevel()
        for btn in letterButtons { btn.isHidden = false }
    }
}
