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
  
  var pokemonImageUrl: String?
  var pokemonType: String?
  
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
      
      if let imageUrlString = pokemonImageUrl, let url = URL(string: imageUrlString) {
        loadImage(from: url)
      }
      
      typeLabel.text = pokemonType
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
    
    imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    
    typeLabel = UILabel()
    typeLabel.font = UIFont(name: "Avenir", size: 20)
    typeLabel.textColor = .darkGray
    typeLabel.textAlignment = .center
    
    view.addSubview(nameLabel)
    view.addSubview(imageView)
    view.addSubview(typeLabel)
    
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    imageView.translatesAutoresizingMaskIntoConstraints = false
    typeLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      
      imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
      imageView.widthAnchor.constraint(equalToConstant: 200),
      imageView.heightAnchor.constraint(equalToConstant: 200),
      
      typeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      typeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
    ])
  }
}
