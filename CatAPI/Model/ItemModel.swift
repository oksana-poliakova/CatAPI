//
//  ItemModel.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 26.07.2022.
//

import Foundation

struct ItemModel {
    let id: String
    var title: String? = nil
    var url: URL? = nil
    let select: ((_ id: String) -> Void)?
    
    init(id: String, title: String? = nil, url: URL? = nil, select: ((_ id: String) -> Void)? = nil) {
        self.id = id
        self.title = title
        self.url = url
        self.select = select
    }
}
