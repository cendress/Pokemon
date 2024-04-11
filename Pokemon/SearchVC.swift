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
    view.backgroundColor = UIColor(named: "BackgroundColor")
    
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
    
    let goButton = UIButton()
    goButton.setTitle("Go", for: .normal)
    goButton.setTitleColor(.white, for: .normal)
    goButton.backgroundColor = UIColor.green
    goButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
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
      searchBar.heightAnchor.constraint(equalToConstant: 60),
      
      goButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 60),
      goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      goButton.heightAnchor.constraint(equalToConstant: 100),
      goButton.widthAnchor.constraint(equalToConstant: 200)
    ])
  }
}
