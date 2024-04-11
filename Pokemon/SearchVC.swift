//
//  ViewController.swift
//  Pokemon
//
//  Created by Christopher Endress on 4/10/24.
//

import UIKit

class SearchVC: UIViewController {
  var titleLabel: UILabel!
  var searchBar: UITextField!
  var goButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(named: "BackgroundColor")
    
    setupViews()
    
    goButton.addTarget(self, action: #selector(goButtonPressed), for: .touchUpInside)
  }
  
  //MARK: - @Objc method
  
  @objc private func goButtonPressed() {
    guard let searchText = searchBar.text, !searchText.isEmpty else {
      return
    }
    
    let pokemonManager = PokemonManager()
    pokemonManager.fetchPokemon(name: searchText) { [weak self] pokemon in
      DispatchQueue.main.async {
        guard let pokemon = pokemon else {
          print("Failed to fetch Pokemon")
          return
        }
        
        let detailVC = DetailVC()
        detailVC.pokemonName = pokemon.name
        self?.navigationController?.pushViewController(detailVC, animated: true)
      }
    }
  }
  
  //MARK: - UI Setup
  
  private func setupViews() {
    let title = UILabel()
    title.text = "Pokémon Search"
    title.font = UIFont(name: "Avenir", size: 40)
    title.textColor = .label
    
    let searchBar = UITextField()
    searchBar.placeholder = "Type the name of a Pokémon..."
    searchBar.font = UIFont(name: "Avenir", size: 18)
    searchBar.layer.cornerRadius = 10
    searchBar.clipsToBounds = true
    searchBar.backgroundColor = UIColor.systemGray6
    searchBar.clearButtonMode = .whileEditing
    searchBar.borderStyle = .none
    
    let goButton = UIButton()
    goButton.setTitle("GO!", for: .normal)
    goButton.titleLabel?.font = UIFont(name: "Avenir", size: 25)
    goButton.setTitleColor(.white, for: .normal)
    goButton.backgroundColor = UIColor.green
    goButton.layer.cornerRadius = 10
    goButton.clipsToBounds = true
    goButton.layer.shadowColor = UIColor.black.cgColor
    goButton.layer.shadowOffset = CGSize(width: 0, height: 2)
    goButton.layer.shadowRadius = 6
    goButton.layer.shadowOpacity = 0.3
    
    view.addSubview(title)
    view.addSubview(searchBar)
    view.addSubview(goButton)
    
    title.translatesAutoresizingMaskIntoConstraints = false
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    goButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      title.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -60),
      
      searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      searchBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
      searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
      searchBar.heightAnchor.constraint(equalToConstant: 50),
      
      goButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 60),
      goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      goButton.heightAnchor.constraint(equalToConstant: 50),
      goButton.widthAnchor.constraint(equalToConstant: 150)
    ])
  }
}
