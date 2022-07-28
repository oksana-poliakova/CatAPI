//
//  ItemModel.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 26.07.2022.
//

import Foundation

// MARK: - Item model

struct ItemModel {
    let id: String
    var title: String? = nil
    var url: URL? = nil
    let select: () -> Void
}

// MARK: - Category

extension ItemModel {
    init(category: CategoryElement, selection: @escaping () -> Void) {
        title = category.name
        id = "\(category.id)"
        select = selection
    }
}

// MARK: - Breed

extension ItemModel {
    init(breed: BreedElement, selection: @escaping () -> Void) {
        title = breed.name
        id = breed.id
        select = selection
    }
}

// MARK: - Image

extension ItemModel {
    init(image: Image, selection: @escaping () -> Void = {}) {
        id = image.id ?? ""
        url = URL(string: image.url ?? "")
        select = selection
    }
}

// MARK: - Cats(or Breed by id)

extension ItemModel {
    init(cat: Cat, selection: @escaping () -> Void = {}) {
        id = cat.id ?? ""
        url = URL(string: cat.url ?? "")
        select = selection
    }
}
