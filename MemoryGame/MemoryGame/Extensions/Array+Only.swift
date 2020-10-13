//
//  Array+Only.swift
//  MemoryGame
//
//  Created by Ederson Machado on 13/10/20.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
