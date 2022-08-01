//
//  BreedAdapter.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 26.07.2022.
//

import Foundation

// MARK: - Adapter for getting breeds

struct BreedNetworkServiceAdapter: ItemsNetworkService {
    private let api: NetworkManager
    private let select: ((BreedElement) -> Void)?
    private static var page: Int = 0
    
    init(api: NetworkManager, select: ((BreedElement) -> Void)?) {
        self.api = api
        self.select = select
    }
    
    func fetch(completion: @escaping ([ItemModel]) -> ()) {
        api.fetch(Breed.self, endPoint: Endpoint.breeds + "\(BreedNetworkServiceAdapter.page)") { result in
            switch result {
            case let .success(breed):
                BreedNetworkServiceAdapter.page += 1
                DispatchQueue.mainAsyncIfNeeded {
                    completion(breed.map({ breedElement in
                        ItemModel(breed: breedElement) {
                            select?(breedElement)
                        }
                    }))
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
