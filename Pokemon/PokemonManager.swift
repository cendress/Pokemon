//
//  PokemonManager.swift
//  Pokemon
//
//  Created by Christopher Endress on 4/11/24.
//

import Foundation

struct PokemonManager {
  func fetchPokemon(name: String, completion: @escaping (Pokemon?) -> Void) {
    let formattedName = name.lowercased()
    let urlString = "https://pokeapi.co/api/v2/pokemon/\(formattedName)/"
    guard let url = URL(string: urlString) else {
      print("Invalid URL")
      completion(nil)
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        print("Error fetching data: \(error)")
        completion(nil)
        return
      }
      
      guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        print("Invalid response or status code")
        completion(nil)
        return
      }
      
      guard let data = data else {
        print("No data received")
        completion(nil)
        return
      }
      
      do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let pokemon = try decoder.decode(Pokemon.self, from: data)
        completion(pokemon)
      } catch {
        print("JSON failed to decode: \(error)")
        completion(nil)
      }
    }
    task.resume()
  }
  
}
