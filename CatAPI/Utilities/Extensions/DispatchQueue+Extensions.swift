//
//  DispatchQueue+Extensions.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 26.07.2022.
//

import Foundation

extension DispatchQueue {
    static func mainAsyncIfNeeded(execute work: @escaping () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            main.async(execute: work)
        }
    }
}
