//
//  CategoriesViewController.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 11.07.2022.
//

import UIKit

final class CategoryViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var categoriesCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private let countCells = 3
    private let offset: CGFloat = 1.0
    
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

    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        
    }

}

// MARK: - UICollectionViewDataSource

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCollectionView = collectionView.frame
        let widthCell = frameCollectionView.width / CGFloat(countCells)
        let heightCell = widthCell
        let spacing = CGFloat((countCells)) * offset / CGFloat(countCells)
        return CGSize(width: widthCell - spacing, height: heightCell - (offset * 1))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
}

// MARK: - UICollectionViewDelegate

extension CategoryViewController: UICollectionViewDelegate {
    
}


