//
//  ItemsNetworkService.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 26.07.2022.
//

import Foundation

// MARK: - Abstract class with a fetch logic

protocol ItemsNetworkService {
    func fetch(completion: @escaping([ItemModel]) -> ())
}
