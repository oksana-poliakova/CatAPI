//
//  ListTableViewCell.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 26.07.2022.
//

import UIKit
import Kingfisher

// MARK: - Basic cell for Breeds and Categories

class ListTableViewCell: UITableViewCell {
    
    // MARK: - Properties

    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.textColor = .blue
        return title
    }()
    
    private lazy var listImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var stackView = UIStackView(arrangedSubviews: [listImageView, titleLabel],
                                            axis: .horizontal,
                                            spacing: 10,
                                            distribution: .fill,
                                            aligment: .fill)

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
        listImageView.isHidden = item.type == .breed ? false : true
        if let url = item.url {
            listImageView.kf.setImage(with: url)
        }
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            listImageView.heightAnchor.constraint(equalToConstant: 50),
            listImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        listImageView.layer.cornerRadius = 50 / 2
    }
}
