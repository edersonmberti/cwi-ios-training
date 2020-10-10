//
//  String+AttributedText.swift
//  Forca
//
//  Created by Ederson Machado on 08/10/20.
//  Copyright © 2020 Ederson Machado. All rights reserved.
//

import UIKit

public extension String {
    
    var spaced: NSMutableAttributedString {
        let spaceAttribute: [NSAttributedString.Key: Any] = [
            .kern: 12
        ]
        
        return NSMutableAttributedString(string: self, attributes: spaceAttribute)
    }
    
    var setGreenColor: NSMutableAttributedString {
        let greenAttribute: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.green
        ]
        
        return NSMutableAttributedString(string: self, attributes: greenAttribute)
    }
    
    var setRedColor: NSMutableAttributedString {
        let redAttribute: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.red
        ]
        
        return NSMutableAttributedString(string: self, attributes: redAttribute)
    }
}

extension NSMutableAttributedString {
    var spaced: NSMutableAttributedString {
        let copy = NSMutableAttributedString(attributedString: self)
        let spaceAttribute: [NSAttributedString.Key: Any] = [
            .kern: 12
        ]
        
        copy.addAttributes(spaceAttribute, range: NSMakeRange(0, self.length))
        return copy
    }
}
