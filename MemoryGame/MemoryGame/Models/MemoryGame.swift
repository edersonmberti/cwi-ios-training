//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Ederson Machado on 10/10/20.
//

import Foundation

class MemoryGame {

    private(set) var cards: [MemoryCard] = []
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    private func getCardsShuffled() -> [MemoryCard] {
        var cards: [MemoryCard] = []
        for image in memoryGameImages {
            cards.append(MemoryCard(content: image))
            cards.append(MemoryCard(content: image))
        }
        
        return cards.shuffled()
    }
    
    internal init() {
        self.cards = self.getCardsShuffled()
    }
    
    private func restart() {
        self.cards = getCardsShuffled()
    }
    
    private func choose(memoryCard: MemoryCard) {
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
    }
    
    private func toFaceDown() {
        for index in cards.indices {
            cards[index].isFaceUp = false
        }
    }
    
    struct MemoryCard: Identifiable {
        var id: UUID = UUID()
        var content: String
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
}

let memoryGameImages = ["wizard", "elf", "dwalf", "knight", "witch"]
