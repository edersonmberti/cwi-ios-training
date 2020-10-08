//
//  String+AttributedText.swift
//  Forca
//
//  Created by Ederson Machado on 08/10/20.
//  Copyright © 2020 Ederson Machado. All rights reserved.
//

import Foundation

public extension String {
    
    var spaced: NSMutableAttributedString {
        let spaceAttribute: [NSAttributedString.Key: Any] = [
            .kern: 12
        ]
        
        return NSMutableAttributedString(string: self, attributes: spaceAttribute)
    }
    
}
