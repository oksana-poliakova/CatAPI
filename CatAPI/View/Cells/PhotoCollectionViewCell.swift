//
//  CategoryCollectionViewCell.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 11.07.2022.
//

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    private var photoImageView = UIImageView()
    
    // MARK: - Init

   init() {
       super.init(frame: .zero)
       
       backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    
    public func configureCell(image: UIImage) {
        photoImageView.image = image
    }
}

