//
//  CategoryAdapter.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 26.07.2022.
//

import Foundation

// MARK: - Adapter for getting categories

struct CategoryNetworkServiceHelper {
    private let api: NetworkManager
    private static var page: Int = 0
    
    init(api: NetworkManager) {
        self.api = api
    }
    
    func fetch(completion: @escaping (Category) -> ()) {
        api.fetch(Category.self, endPoint: Endpoint.categories + "\(CategoryNetworkServiceHelper.page)") { result in
            switch result {
            case let .success(categories):
                CategoryNetworkServiceHelper.page += 1
                DispatchQueue.mainAsyncIfNeeded {
                    completion(categories)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
