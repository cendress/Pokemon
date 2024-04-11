//
//  PokemonManager.swift
//  Pokemon
//
//  Created by Christopher Endress on 4/11/24.
//

import Foundation

struct PokemonManager {
  
  private func fetchPokemon(name: String) {
    let urlString = "https://pokeapi.co/api/v2/pokemon/\(name)/"
    
    if let url = URL(string: urlString) {
      let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
          print("Error, \(error)")
          return
        }
        
        if let response = response as? HTTPURLResponse, response.statusCode == 200 {
          if let data = data {
            do {
              let decoder = JSONDecoder()
              decoder.keyDecodingStrategy = .convertFromSnakeCase
              let pokemon = try decoder.decode(Pokemon.self, from: data)
            } catch {
              print("JSON failed to decode, \(error)")
            }
          }
        } else {
          print("Invalid response")
        }
      }
      
      task.resume()
    } else {
      print("Invalid URL")
    }
  }
}
