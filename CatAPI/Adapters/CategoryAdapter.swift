//
//  CategoryAdapter.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 26.07.2022.
//

import Foundation

// MARK: - Adapter for getting categories

struct CategoryAdapter: ItemsNetworkService {
    let api: NetworkManager
    let endpoint: String
    let select: (_ id: String) -> Void
    
    func fetch(completion: @escaping ([ItemModel]) -> ()) {
        api.fetch(Category.self, endPoint: endpoint) { result in
            switch result {
            case let .success(categories):
                DispatchQueue.mainAsyncIfNeeded {
                    completion(categories.map({ categoryObject in
                        ItemModel(id: "\(categoryObject.id)", title: categoryObject.name, select: { id in
                            select(id)
                        })
                    }))
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
