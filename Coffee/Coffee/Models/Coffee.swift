//
//  Coffee.swift
//  Coffee
//
//  Created by Ederson Machado on 13/10/20.
//

import Foundation

public struct Coffee: Decodable, CustomStringConvertible {
    public var description: String { name }
    
    let id: Int
    let name: String
    let price: Double
    let image: String
    let measures: [Measures]
    let coffeeDescription: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case price = "precoUnitario"
        case image = "imagem"
        case measures = "medidas"
        case coffeeDescription = "descricao"
    }
    
    enum Measures: String, Decodable {
        case lungo, espresso, ristretto
    }
}

public typealias Coffees = [Coffee]
