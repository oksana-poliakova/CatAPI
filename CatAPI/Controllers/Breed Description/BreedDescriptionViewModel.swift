//
//  BreedDescriptionVM.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 02.08.2022.
//

import Foundation

final class BreedDescriptionViewModel {
    
    private var breeds: [BreedElement] = []
    private let helper: BreedNetworkServiceHelper
    weak var rootViewController: BreedDescriptionViewController? = nil
    
    init(helper: BreedNetworkServiceHelper) {
        self.helper = helper
    }
    
    // MARK: - Fetch data
    
    func fetchItems() {
        helper.fetch { [weak self] breed in
            self?.breeds = breed
            self?.rootViewController?.loadItems(breed: breed)
        }
    }
}
