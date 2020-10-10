//
//  String+Comparable.swift
//  Forca
//
//  Created by Ederson Machado on 10/10/20.
//  Copyright © 2020 Ederson Machado. All rights reserved.
//

import Foundation

extension String {
    var comparable: String {
        self.uppercased().folding(
            options: .diacriticInsensitive,
            locale: .current
        )
    }
}
