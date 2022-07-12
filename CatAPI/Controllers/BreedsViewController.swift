//
//  BreedsViewController.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 11.07.2022.
//

import UIKit

class BreedsViewController: UIViewController {

    // MARK: - Properties
    
    private let breedsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .blue
        label.text = "Breed 1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Init
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        title = "List of Breeds"
        getBreeds()
        view.addSubview(breedsTitleLabel)
        
        NSLayoutConstraint.activate([
            breedsTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            breedsTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            breedsTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    // MARK: - Getting data
    
    private func getBreeds() {
        NetworkManager.shared.fetchBreeds { [weak self] result in
            switch result {
            case .success(let breed):
                self?.breedsTitleLabel.text = breed.first?.name
                print(breed)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
