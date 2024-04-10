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
    
    view.addSubview(title)
    
    title.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      title.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
      title.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
  }


}

