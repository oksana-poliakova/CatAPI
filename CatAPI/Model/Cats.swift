//
//  CatsModel.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 09.07.2022.
//

import Foundation

// MARK: - Post

struct Post: Codable {
    let id: String?
    let url: String?
    let width: Int?
    let height: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
        case width = "width"
        case height = "height"
    }
}

typealias Posts = [Post]

