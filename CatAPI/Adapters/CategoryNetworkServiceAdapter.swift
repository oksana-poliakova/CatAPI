//
//  CategoryAdapter.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 26.07.2022.
//

import Foundation

// MARK: - Adapter for getting categories

struct CategoryNetworkServiceAdapter: ItemsNetworkService {
    private let api: NetworkManager
    private let select: ((CategoryElement) -> Void)?
    private static var page: Int = 0
    
    init(api: NetworkManager, select: ((CategoryElement) -> Void)?) {
        self.api = api
        self.select = select
    }
    
    func fetch(completion: @escaping ([ItemModel]) -> ()) {
        api.fetch(Category.self, endPoint: Endpoint.categories + "\(CategoryNetworkServiceAdapter.page)") { result in
            switch result {
            case let .success(categories):
                CategoryNetworkServiceAdapter.page += 1
                DispatchQueue.mainAsyncIfNeeded {
                    completion(categories.map({ categoryObject in
                        ItemModel(category: categoryObject) {
                            select?(categoryObject)
                        }
                    }))
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
