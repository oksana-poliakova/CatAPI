//
//  NetworkManager.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 11.07.2022.
//

import Foundation
import UIKit

enum Endpoint {
    static let images = "/images/search"
    static let breeds = "/breeds"
    static let categories = "/categories"
}

enum URLProvider {
    static let baseURL = "https://api.thecatapi.com/v1"
}

enum MyError: Error {
    case cantParseValue
}

final class NetworkManager {
    
    // MARK: - Properties
    
    private let apiKeyString = "8d1dcf00-b9ce-4f19-9e22-e0520be65bd8"
    static let shared: NetworkManager = NetworkManager()
    
    private init() { }

    // MARK: - Fetch data

    func fetch<T: Decodable>(_ : T.Type = T.self,
                             endPoint: String,
                             completion: @escaping (Result<T, MyError>) -> Void) {
        
        guard let url = URL(string: URLProvider.baseURL + endPoint) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.global(qos: .background).async {
                guard let data = data else { return }
   
                guard let object = try? JSONDecoder().decode(T.self, from: data) else {
                    completion(.failure(MyError.cantParseValue))
                    return
                }
                
                DispatchQueue.main.async {
                    completion(.success(object))
                }
            }
        }.resume()
    }
}
