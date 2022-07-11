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
        
        let breedsVC = BreedsViewController()
        breedsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        breedsVC.tabBarItem.title = "Breeds"
        
        let categoriesVC = CategoriesViewController()
        categoriesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        setViewControllers([UINavigationController(rootViewController: breedsVC), UINavigationController(rootViewController: categoriesVC)], animated: true)
    }
}
