//
//  BreedListViewModel.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 02.08.2022.
//

final class BreedListViewModel {
    
    private var breeds: [BreedElement] = []
    private let helper: BreedNetworkServiceHelper
    
    init(helper: BreedNetworkServiceHelper) {
        self.helper = helper
    }
    
    // MARK: - Fetch data
    
    func fetchItems() {
        helper.fetch { [weak self] breed in
            self?.breeds = breed
        }
    }
}
