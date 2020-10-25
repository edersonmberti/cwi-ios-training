//
//  Game.swift
//  MemoryGame
//
//  Created by Ederson Machado on 13/10/20.
//

import Foundation

class Game {

    private(set) var cards: [MemoryCard] = []
    private(set) var win: Bool = false
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    internal init() {
        self.cards = self.getNewCards()
        self.shuffledCards()
    }
    
    private func getNewCards() -> [MemoryCard] {
        var cards: [MemoryCard] = []
        for image in memoryGameImages {
            cards.append(MemoryCard(content: image))
            cards.append(MemoryCard(content: image))
        }
        
        return cards
    }
    
    private func shuffledCards() {
        self.cards = self.cards.shuffled()
    }
    
    func restart() {
        self.cards = getNewCards()
        self.shuffledCards()
        self.indexOfTheOneAndOnlyFaceUpCard = nil
    }
    
    func choose(memoryCard: MemoryCard) {
        if let chosenIndex = cards.firstIndex(matching: memoryCard), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
        
        alreadyWon()
    }
    
    private func alreadyWon() {
        let unmatched = cards.filter { $0.isMatched == false }
        
        if (unmatched.isEmpty) {
            self.win = true
        }
    }
    
    struct MemoryCard: Identifiable {
        var id: UUID = UUID()
        var content: String
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
}

let memoryGameImages = ["wizard", "elf", "dwarf", "knight", "witch"]
