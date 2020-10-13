//
//  Accessories.swift
//  Coffee
//
//  Created by Ederson Machado on 13/10/20.
//

import Foundation

public struct Accessory: Decodable, CustomStringConvertible {
    public var description: String { category }
    
    let category: String
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case category = "categoria"
        case items = "itens"
    }
}

