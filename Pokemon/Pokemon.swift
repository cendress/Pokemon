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
  let sprites: PokemonSprites
  let types: [PokemonTypeEntry]
  
  struct PokemonSprites: Codable {
    let frontDefault: String?
    let backDefault: String?
    let other: OtherSprites?
    
    enum CodingKeys: String, CodingKey {
      case frontDefault = "front_default"
      case backDefault = "back_default"
      case other
    }
    
    struct OtherSprites: Codable {
      let officialArtwork: OfficialArtwork?
      
      enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
      }
      
      struct OfficialArtwork: Codable {
        let frontDefault: String?
        
        enum CodingKeys: String, CodingKey {
          case frontDefault = "front_default"
        }
      }
    }
  }
  
  struct PokemonTypeEntry: Codable {
    let slot: Int
    let type: PokemonType
    
    struct PokemonType: Codable {
      let name: String
    }
  }
}
