//
//  BreedByIDNetworkServiceAdapter.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 28.07.2022.
//

import Foundation

// MARK: - Adapter for getting cats

struct CatsNetworkServiceAdapter: ItemsNetworkService {
    let api: NetworkManager
    let endpoint: String
    
    func fetch(completion: @escaping ([ItemModel]) -> ()) {
        api.fetch(Cats.self, endPoint: endpoint) { result in
            switch result {
            case let .success(cats):
                DispatchQueue.mainAsyncIfNeeded {
                    completion(cats.map({ cat in
                        ItemModel(cat: cat)
                    }))
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
