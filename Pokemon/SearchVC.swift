//
//  ViewController.swift
//  Pokemon
//
//  Created by Christopher Endress on 4/10/24.
//

import UIKit

class SearchVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    
    setupViews()
  }
  
  private func setupViews() {
    let title = UILabel()
    title.text = "Pokémon Search"
    title.font = UIFont(name: "Avenir", size: 40)
    title.textColor = .label
    
    let searchBar = UITextField()
    searchBar.placeholder = "Type the name of a Pokémon..."
    searchBar.font = UIFont(name: "Avenir", size: 20)
    searchBar.layer.cornerRadius = 10
    searchBar.clipsToBounds = true
    searchBar.backgroundColor = UIColor.systemGray6
    searchBar.clearButtonMode = .whileEditing
    searchBar.borderStyle = .none
    
    view.addSubview(title)
    view.addSubview(searchBar)
    
    title.translatesAutoresizingMaskIntoConstraints = false
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      title.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -60),
      
      searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      searchBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
      searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
      searchBar.heightAnchor.constraint(equalToConstant: 60)
    ])
  }


}

