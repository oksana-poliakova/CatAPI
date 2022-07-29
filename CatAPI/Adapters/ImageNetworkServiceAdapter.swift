//
//  ImageAdapter.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 27.07.2022.
//

import Foundation

// MARK: - Adapter for getting images

struct ImageNetworkServiceAdapter: ItemsNetworkService {
    private let api: NetworkManager
    private let categoryID: String
    private static var page: Int = 0
    
    init(api: NetworkManager, categoryID: String) {
        self.api = api
        self.categoryID = categoryID
    }
    
    func fetch(completion: @escaping ([ItemModel]) -> ()) {
        api.fetch([Image].self, endPoint: Endpoint.images + "?limit=10&page=\(ImageNetworkServiceAdapter.page)&category_id=\(categoryID)") { result in
            switch result {
            case let .success(images):
                ImageNetworkServiceAdapter.page += 1
                DispatchQueue.mainAsyncIfNeeded {
                    completion(images.map({ image in
                        ItemModel(image: image)
                    }))
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
