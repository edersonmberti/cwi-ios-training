//
//  Capsule.swift
//  Coffee
//
//  Created by Ederson Machado on 13/10/20.
//

import Foundation

public struct Capsule: Decodable, CustomStringConvertible {
    public var description: String { category }
    
    let category: String
    let coffees: [Coffee]
    
    enum CodingKeys: String, CodingKey {
        case category = "categoria"
        case coffees = "cafes"
    }
    
}

public typealias Capsules = [Capsule]
