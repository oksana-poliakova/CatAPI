//
//  BaseLabel.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 28.07.2022.
//

import UIKit

// MARK: - Font styles for a basic label

enum LabelFontStyle {
    case regular
    case bold
    case italic
}

final class BaseLabel: UILabel {
    
    init(type: LabelFontStyle) {
        super.init(frame: .zero)
        applyLabelFontStyles(type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyLabelFontStyles(type: LabelFontStyle) {
        textColor = .black
        textAlignment = .center
        numberOfLines = 0
        
        switch type {
        case .bold:
            font = UIFont.boldSystemFont(ofSize: 14)
        case .italic:
            font = UIFont.italicSystemFont(ofSize: 14)
        case .regular:
            font = UIFont.systemFont(ofSize: 14)
        }
    }
}
