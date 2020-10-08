//
//  ReplaceLetter.swift
//  Forca
//
//  Created by Ederson Machado on 08/10/20.
//  Copyright © 2020 Ederson Machado. All rights reserved.
//

import Foundation

func replaceLetter(to letter: String, in mask: String, with original: String) -> String {
    let character = Character(letter)
    var result = mask
    
    for index in original.indices {
        if original[index] == character {
            result.remove(at: index)
            result.insert(character, at: index)
        }
    }
    
    return result
}
