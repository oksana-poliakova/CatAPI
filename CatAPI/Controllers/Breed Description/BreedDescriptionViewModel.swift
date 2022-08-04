//
//  BreedDescriptionVM.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 02.08.2022.
//

import Foundation

final class BreedDescriptionViewModel {
    
    private var cats: [Cat] = []
    private var breed: BreedElement
    private let helper: CatsNetworkServiceHelper
    weak var rootViewController: BreedDescriptionViewController? = nil
    private static var page: Int = 0
    
    init(breed: BreedElement, helper: CatsNetworkServiceHelper) {
        self.helper = helper
        self.breed = breed
    }
    
    // MARK: - Fetch data
    
    func configureBreedDescription() {
        rootViewController?.configureBreedDescription(breed: breed)
    }
    
    func fetchItems() {
        helper.fetch { [weak self] cats in
            self?.cats = cats
            self?.rootViewController?.loadItems(cat: cats)
        }
    }
}
