//
//  DetailVC.swift
//  Pokemon
//
//  Created by Christopher Endress on 4/11/24.
//

import UIKit

class DetailVC: UIViewController {
  var nameLabel: UILabel!
  
  var pokemonName: String? {
    didSet {
      nameLabel.text = pokemonName
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(named: "BackgroundColor")
    
    setupViews()
  }
  
  private func setupViews() {
    nameLabel = UILabel()
    nameLabel.font = UIFont(name: "Avenir", size: 24)
    nameLabel.textColor = .label
    nameLabel.textAlignment = .center
    
    view.addSubview(nameLabel)
    
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
  
}
