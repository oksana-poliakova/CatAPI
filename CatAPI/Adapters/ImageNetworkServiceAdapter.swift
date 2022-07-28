//
//  ImageAdapter.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 27.07.2022.
//

import Foundation

// MARK: - Adapter for getting images

struct ImageNetworkServiceAdapter: ItemsNetworkService {
    let api: NetworkManager
    let endpoint: String
    
    func fetch(completion: @escaping ([ItemModel]) -> ()) {
        api.fetch([Image].self, endPoint: endpoint) { result in
            switch result {
            case let .success(images):
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
