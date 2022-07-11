//
//  NetworkManager.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 11.07.2022.
//

import Foundation
import UIKit

final class NetworkManager {
    
    // MARK: - Properties
    
    private let urlString = "https://api.thecatapi.com/v1/images/search"
    private let apiKeyString = "8d1dcf00-b9ce-4f19-9e22-e0520be65bd8"
    static let shared: NetworkManager = NetworkManager()
    
    private init() { }
    
    // MARK: - Fetch data
    
    func fetchCatData(completion: @escaping(Post) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.global(qos: .background).async {
                guard let data = data else { return }
   
                let posts = try? JSONDecoder().decode(Posts.self, from: data)

                guard let post = posts?.first else { return }
                
                DispatchQueue.main.async {
                    completion(post)
                }
            }
        }.resume()
    }
    
}
