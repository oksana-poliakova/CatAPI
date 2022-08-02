//
//  BreedAdapter.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 26.07.2022.
//

import Foundation

// MARK: - Helper for getting breeds

struct BreedNetworkServiceHelper {
    private let api: NetworkManager
    private static var page: Int = 0
    
    init(api: NetworkManager) {
        self.api = api
    }
    
    func fetch(completion: @escaping ([BreedElement]) -> ()) {
        api.fetch(Breed.self, endPoint: Endpoint.breeds + "\(BreedNetworkServiceHelper.page)") { result in
            switch result {
            case let .success(breed):
                BreedNetworkServiceHelper.page += 1
                DispatchQueue.mainAsyncIfNeeded {
                    completion(breed)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
