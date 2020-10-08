//
//  ForcaTests.swift
//  ForcaTests
//
//  Created by Ederson Machado on 06/10/20.
//  Copyright © 2020 Ederson Machado. All rights reserved.
//

import XCTest
@testable import Forca

class ForcaTests: XCTestCase {

    func testExemple() throws {
        let word = "DOG"
        var mask = "___"
        
        mask = replaceLetter(to: "O", in: mask, with: word)
        
        XCTAssert(mask == "_O_", mask)
        
        mask = replaceLetter(to: "X", in: mask, with: word)
        
        XCTAssertEqual(mask, "_O_")
    }
}
