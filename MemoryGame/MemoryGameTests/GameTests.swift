//
//  MemoryGameModelTests.swift
//  MemoryGameTests
//
//  Created by Ederson Machado on 13/10/20.
//

import Foundation
import Quick
import Nimble

@testable import MemoryGame

class MemoryGameModelTests: QuickSpec {
    
    override func spec() {
        var memoryGame: MemoryGame
        
        beforeEach {
            memoryGame = MemoryGame()
        }
        
        describe("when playing normally", {
            
            context("when hit all the doubles") {
                it("should win the game") {
                    memoryGame.choose(memoryCard: memoryGame.cards[0])
                }
            }
            
            
        })
    }
    
}
