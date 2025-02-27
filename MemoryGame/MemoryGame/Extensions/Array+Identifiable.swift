//
//  Array+Identifiable.swift
//  MemoryGame
//
//  Created by Ederson Machado on 13/10/20.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
