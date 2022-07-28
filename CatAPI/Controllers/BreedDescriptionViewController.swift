//
//  BreedDescriptionViewController.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 28.07.2022.
//

import UIKit
import FSPagerView

final class BreedDescriptionViewController: UIViewController {
    
    // MARK: - Properties
    
    private var pagerView = ImagePagerView()
    private let descriptionView = BreedDescriptionView()
    var service: ItemsNetworkService? = nil
    
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
        
        setupConstraints()
        loadItems()
    }
    
    private func loadItems() {
        service?.fetch(completion: { [weak self] items in
            guard self != nil else { return }
            
            self?.pagerView.itemModel = items
        })
    }
    
    // MARK: - Setup UI
    
    private func setupConstraints() {
        
        [pagerView, descriptionView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            pagerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pagerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pagerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pagerView.heightAnchor.constraint(equalToConstant: 350),
            
            descriptionView.topAnchor.constraint(equalTo: pagerView.bottomAnchor, constant: 20),
            descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
