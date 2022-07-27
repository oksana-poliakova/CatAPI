//
//  BreedAdapter.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 26.07.2022.
//

import Foundation

// MARK: - Adapter for getting breeds

struct BreedAdapter: ItemsNetworkService {
    let api: NetworkManager
    let endpoint: String
    let select: (_ id: String) -> Void
    
    func fetch(completion: @escaping ([ItemModel]) -> ()) {
        api.fetch(Breed.self, endPoint: endpoint) { result in
            switch result {
            case let .success(breed):
                DispatchQueue.mainAsyncIfNeeded {
                    completion(breed.map({ breedElement in
                        ItemModel(id: breedElement.id, title: breedElement.name, select: { id in
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
