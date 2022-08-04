//
//  BreedByIDNetworkServiceAdapter.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 28.07.2022.
//

import Foundation

// MARK: - Adapter for getting cats

struct CatsNetworkServiceHelper {
    private let api: NetworkManager
    private let breedID: String
    private let page: Int = 0
    
    init(api: NetworkManager, breedID: String) {
        self.api = api
        self.breedID = breedID
    }
    
    func fetch(completion: @escaping (Cats) -> ()) {
        api.fetch(Cats.self, endPoint: Endpoint.images + "?limit=10&page=\(page)&breed_ids=\(breedID)") { result in
            switch result {
            case let .success(cats):
                DispatchQueue.mainAsyncIfNeeded {
                    completion(cats)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
