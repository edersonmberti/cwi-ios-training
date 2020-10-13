//
//  Item.swift
//  Coffee
//
//  Created by Ederson Machado on 13/10/20.
//

import Foundation

public struct Item: Decodable, CustomStringConvertible {
    public var description: String { name }
    
    let id: Int
    let name: String
    let price: Double
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case price = "preco"
        case image = "imagem"
    }
}
