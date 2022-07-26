//
//  ListTableViewCell.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 26.07.2022.
//

import UIKit

// MARK: - Basic cell for Breeds and Categories

class ListTableViewCell: UITableViewCell {
    
    // MARK: - Properties

    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    
    func configureCell(item: ItemModel) {
        titleLabel.text = item.title
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        
        titleLabel.textColor = .blue
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
}
