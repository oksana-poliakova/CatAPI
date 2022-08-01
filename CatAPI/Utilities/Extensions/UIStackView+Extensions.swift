//
//  UIStackView+Extensions.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 01.08.2022.
//

import UIKit

// MARK: - Adding arranged subviews to the stackView with property initialization

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: UIStackView.Distribution, aligment: UIStackView.Alignment) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.alignment = aligment
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

