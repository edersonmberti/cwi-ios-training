//
//  HangingGameTests.swift
//  ForcaTests
//
//  Created by Ederson Machado on 10/10/20.
//  Copyright © 2020 Ederson Machado. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import Forca

class HangingGameTests: QuickSpec {

    override func spec() {
        var hangingGame: HangingGame!
        beforeEach {
            hangingGame = HangingGame(word: "JACARÉ", guess: "ANIMAL")
        }
        
        describe("when playing normally", {
            context("when writing a correct letter") {
                it("should haven't any errors") {
                    hangingGame.attemptLetter("J")
                    expect(hangingGame.errors).to(equal(.zero))
                    expect(hangingGame.maskedWord).to(equal("J_____"))
                }
            }
            
            context("when writing a wrong letter") {
                it("should have an error") {
                    hangingGame.attemptLetter("G")
                    expect(hangingGame.errors).to(equal(1))
                }
            }
            
            context("when repeat a wrong letter") {
                it("should keep one error") {
                    hangingGame.attemptLetter("G")
                    hangingGame.attemptLetter("G")
                    expect(hangingGame.errors).to(equal(1))
                }
            }
            
            context("when everything goes wrong") {
                it("should lose the game") {
                    let attempts = ["I", "B", "P", "Z", "K"]
                    for attempt in attempts {
                        hangingGame.attemptLetter(attempt)
                    }
                    expect(hangingGame.defeat).to(beFalse())
                    hangingGame.attemptLetter("W")
                    expect(hangingGame.defeat).to(beTrue())
                }
            }
            
            context("when is a correct and repeated letter in the word") {
                it("should update both letters") {
                    hangingGame.attemptLetter("A")
                    expect(hangingGame.maskedWord).to(equal("_A_A__"))
                }
            }
            
            context("when is a correct and repeated letter") {
                it("shouldn't generate error") {
                    hangingGame.attemptLetter("A")
                    hangingGame.attemptLetter("A")
                    expect(hangingGame.errors).to(equal(.zero))
                    expect(hangingGame.maskedWord).to(equal("_A_A__"))
                }
            }
            
            context("when all letters correct") {
                it("should win the game") {
                    ["J", "A", "C", "R"].forEach(hangingGame.attemptLetter)
                    expect(hangingGame.errors).to(equal(.zero))
                    expect(hangingGame.win).to(beFalse())
                    
                    ["I", "B", "P", "Z","W", "Ç"].forEach(hangingGame.attemptLetter)
                    expect(hangingGame.win).to(beFalse())
                    expect(hangingGame.defeat).to(beFalse())
                    
                    hangingGame.attemptLetter("E")
                    expect(hangingGame.win).to(beTrue())
                }
            }
        })
    }
    
}
