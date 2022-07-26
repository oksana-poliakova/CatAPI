//
//  CategoryModel.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 12.07.2022.
//

import Foundation

// MARK: - CategoryElement

struct CategoryElement: Codable {
    let id: Int?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}

typealias Category = [CategoryElement]
