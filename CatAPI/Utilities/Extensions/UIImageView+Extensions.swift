//
//  UIImageView+Extensions.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 01.08.2022.
//

import UIKit

extension UIImageView {
    func makeRounded() {
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
