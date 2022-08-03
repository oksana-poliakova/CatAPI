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
        
        let helper = BreedNetworkServiceHelper(api: NetworkManager.shared)
        let viewModel = BreedListViewModel(helper: helper)
        let breedsVC = BreedListViewController(viewModel: viewModel)
        viewModel.rootViewController = breedsVC
//        viewModel.rootViewController = breedsVC
//        let breedServiceAdapter = BreedNetworkServiceAdapter(api: NetworkManager.shared) { [weak breedsVC] breed in
//            breedsVC?.select(breed: breed)
//        }
    
//        breedsVC.service = breedServiceAdapter
        breedsVC.tabBarItem = UITabBarItem(title: "Breeds", image: UIImage(named: "cat"), selectedImage: nil)
        breedsVC.title = "List of Breeds"
        
//        let categoriesVC = ListViewController()
//        let categoryServiceAdapter = CategoryNetworkServiceAdapter(api: NetworkManager.shared, select: { [weak categoriesVC] category in
//            categoriesVC?.select(category: category)
//        })
        
//        categoriesVC.service = categoryServiceAdapter

//        categoriesVC.tabBarItem = UITabBarItem(title: "Categories", image: UIImage(named: "paw"), selectedImage: nil)
//        categoriesVC.title = "List of Categories"
        
        setViewControllers([UINavigationController(rootViewController: breedsVC)], animated: true)
    }
}
