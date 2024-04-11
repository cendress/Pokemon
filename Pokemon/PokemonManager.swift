//
//  PokemonManager.swift
//  Pokemon
//
//  Created by Christopher Endress on 4/11/24.
//

import Foundation

struct PokemonManager {
  func fetchPokemon(name: String, completion: @escaping (Pokemon?) -> Void) {
    let urlString = "https://pokeapi.co/api/v2/pokemon/\(name)/"
    guard let url = URL(string: urlString) else {
      print("Invalid URL")
      completion(nil)
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        print("Error: \(error)")
        completion(nil)
        return
      }
      
      if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data {
        do {
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          let pokemon = try decoder.decode(Pokemon.self, from: data)
          completion(pokemon)
        } catch {
          print("JSON failed to decode: \(error)")
          completion(nil)
        }
      } else {
        print("Invalid response")
        completion(nil)
      }
    }
    task.resume()
  }
}
