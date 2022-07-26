//
//  ViewController.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 11.07.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - Init
        
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let breedServiceAdapter = BreedAdapter(api: NetworkManager.shared, endpoint: Endpoint.breeds)
        let breedsVC = ListViewController(service: breedServiceAdapter)
        breedsVC.tabBarItem = UITabBarItem(title: "Breeds", image: UIImage(named: "cat"), selectedImage: nil)
        breedsVC.title = "List of Breeds"
        
        let categoryServiceAdapter = CategoryAdapter(api: NetworkManager.shared, endpoint: Endpoint.categories)
        let categoriesVC = ListViewController(service: categoryServiceAdapter)
        categoriesVC.tabBarItem = UITabBarItem(title: "Categories", image: UIImage(named: "paw"), selectedImage: nil)
        categoriesVC.title = "List of Categories"
        
        setViewControllers([UINavigationController(rootViewController: breedsVC), UINavigationController(rootViewController: categoriesVC)], animated: true)
    }
}
