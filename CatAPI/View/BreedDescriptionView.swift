//
//  BreedDescriptionTextView.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 28.07.2022.
//

import UIKit

final class BreedDescriptionView: UIView {

    // MARK: - Properties
    
    private var titleLabel = BaseLabel(type: .bold)
    private var idLabel = BaseLabel(type: .bold)
    private var descriptionLabel = BaseLabel(type: .regular)
    private var characterLabel = BaseLabel(type: .regular)
    private var countryLabel = BaseLabel(type: .regular)
    private var weightLabel = BaseLabel(type: .regular)
    private var lifeSpanLabel = BaseLabel(type: .regular)
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureDescriptionView(breed: BreedElement) {
        titleLabel.text = breed.name
        idLabel.text = breed.id
        descriptionLabel.text = breed.breedDescription
        characterLabel.text = breed.temperament
        countryLabel.text = breed.countryCode
        weightLabel.text = "\(breed.weight?.imperial ?? "") kg"
        lifeSpanLabel.text = "\(breed.lifeSpan ?? "") years"
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        [titleLabel, idLabel, descriptionLabel, characterLabel, countryLabel, weightLabel, lifeSpanLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
            
            NSLayoutConstraint.activate([
                $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
            ])
            
            titleLabel.text = "title"
            idLabel.text = "id"
            descriptionLabel.text = "description"
            characterLabel.text = "character"
            countryLabel.text = "country"
            weightLabel.text = "weight"
            lifeSpanLabel.text = "14-16 years"
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            
            idLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            
            descriptionLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 5),
            
            characterLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            
            countryLabel.topAnchor.constraint(equalTo: characterLabel.bottomAnchor, constant: 5),
            
            weightLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 5),
            
            lifeSpanLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 5)
        ])
    }
}

