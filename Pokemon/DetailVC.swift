//
//  DetailVC.swift
//  Pokemon
//
//  Created by Christopher Endress on 4/11/24.
//

import UIKit

class DetailVC: UIViewController {
  var nameLabel: UILabel!
  var imageView: UIImageView!
  var typeLabel: UILabel!
  
  var pokemonName: String? {
    didSet {
      updateUI()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(named: "BackgroundColor")
    let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
    navigationItem.leftBarButtonItem = backButton
    navigationController?.navigationBar.tintColor = .black
    
    setupViews()
    updateUI()
  }
  
  @objc private func backButtonTapped() {
    navigationController?.popViewController(animated: true)
  }
  
  private func updateUI() {
    if isViewLoaded {
      nameLabel.text = pokemonName
    }
  }
  
  // Helper method to load an image from a URL
  private func loadImage(from url: URL) {
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil else { return }
      DispatchQueue.main.async { [weak self] in
        self?.imageView.image = UIImage(data: data)
      }
    }.resume()
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
