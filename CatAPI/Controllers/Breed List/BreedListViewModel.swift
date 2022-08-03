//
//  BreedListViewModel.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 02.08.2022.
//

import Foundation

final class BreedListViewModel {
    
    private var breeds: [BreedElement] = []
    private let helper: BreedNetworkServiceHelper
    weak var rootViewController: BreedListViewController? = nil
    
    init(helper: BreedNetworkServiceHelper) {
        self.helper = helper
    }
    
    // MARK: - Fetch data
    
    func fetchItems(pagination: Bool = false) {
        helper.fetch { [weak self] breed in
            if pagination == true {
                self?.breeds.append(contentsOf: breed)
            } else {
                self?.breeds = breed
            }
            self?.rootViewController?.reloadData()
        }
    }
    
    func countOfItems() -> Int {
        breeds.count
    }
    
    func indexPerItem(indexPath: IndexPath) -> BreedElement {
        breeds[indexPath.row]
    }
}
