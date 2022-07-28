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
    static let imageByCategoryID = images + "?limit=20&page=0&category_id="
    static let breedByID = images + "?limit=20&page=0&breed_ids="
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
    
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue(apiKeyString, forHTTPHeaderField: "x-api-key")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
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
