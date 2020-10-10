//
//  HangingGame.swift
//  Forca
//
//  Created by Ederson Machado on 08/10/20.
//  Copyright © 2020 Ederson Machado. All rights reserved.
//

import Foundation

class HangingGame {
    
    let maxErrors = 5
    
    internal init(word: String, guess: String) {
        self.word = word.comparable
        self.guess = guess
        self.maskedWord = word.map { _ in "_" }.joined()
    }
    
    let word: String
    let guess: String
    private(set) var maskedWord: String
    private(set) var previousAttempts: [String] = []
    private(set) var errors: Int = 0 {
        didSet { if errors > maxErrors { defeat = true } }
    }
        
    
    private(set) var defeat = false
    private(set) var win = false
    
    func attemptLetter(_ letter: String) {
        guard let informedLetter = letter.first?.comparable else { return }
        
        if previousAttempts.contains(informedLetter) {
            // TODO :- Validate repeted word
            
            return
        }
        
        previousAttempts.append(informedLetter)
        
        guard word.contains(informedLetter) else {
            errors += 1
            return
        }
        
        maskedWord = replaceLetter(to: informedLetter, in: maskedWord, with: word)
        
        if word == maskedWord {
            win = true
        }
    }
    
}

extension HangingGame {
    class func random() -> HangingGame {
        guard let item = words.randomElement()
        else {
            return HangingGame(word: "Desnatado", guess: "Microfone")
        }
        
        return HangingGame(word: item.key, guess: item.value)
    }
}

let words = [
    "abelha": "inseto",
    "formiga": "inseto",
    "macaco": "animal",
    "cabra": "animal"
]
