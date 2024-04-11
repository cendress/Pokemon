//
//  Pokemon.swift
//  Pokemon
//
//  Created by Christopher Endress on 4/11/24.
//

import Foundation

struct Pokemon: Codable {
  let id: Int
  let name: String
  let sprites: Sprites
  let types: [PokemonTypeEntry]
  
  struct Sprites: Codable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
      case frontDefault = "front_default"
    }
  }
  
  struct PokemonTypeEntry: Codable {
    let slot: Int
    let type: PokemonType
  }
  
  struct PokemonType: Codable {
    let name: String
  }
}
