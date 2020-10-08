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
        self.word = word
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
        if previousAttempts.contains(letter) {
            // TODO :- Validate repeted word
            
            return
        }
        
        previousAttempts.append(letter)
        
        guard word.contains(letter) else {
            errors += 1
            return
        }
        
        maskedWord = replaceLetter(to: letter, in: maskedWord, with: word)
    }
    
}
