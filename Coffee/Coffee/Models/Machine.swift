//
//  Machine.swift
//  Coffee
//
//  Created by Ederson Machado on 13/10/20.
//

import Foundation

public struct Machine: Decodable, CustomStringConvertible {
    public var description: String { name }
    
    let id: Int
    let name: String
    let price: Double
    let image: String
    let machineDescription: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case price = "preco"
        case image = "imagem"
        case machineDescription = "descricao"
    }
}

public typealias Machines = [Machine]
