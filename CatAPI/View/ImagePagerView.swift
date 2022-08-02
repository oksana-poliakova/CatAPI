//
//  ImagePagerView.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 28.07.2022.
//

import UIKit
import FSPagerView
import Kingfisher

class ImagePagerView: UIView {
    
    // MARK: - Properties
    
    private lazy var pagerView: FSPagerView = {
        let pagerView = FSPagerView(frame: .zero)
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        return pagerView
    }()
    
    private lazy var pageControl: FSPageControl = {
        let pageControl = FSPageControl(frame: .zero)
        return pageControl
    }()
    
    public var itemModel: [BreedElement] = [] {
        didSet {
            pagerView.reloadData()
        }
    }
        
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        [pagerView, pageControl].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            pagerView.topAnchor.constraint(equalTo: topAnchor),
            pagerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pagerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pagerView.heightAnchor.constraint(equalToConstant: 350),
            
            pageControl.leadingAnchor.constraint(equalTo: pagerView.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: pagerView.trailingAnchor),
            pageControl.bottomAnchor.constraint(equalTo: pagerView.bottomAnchor)
        ])
    }
}

// MARK: - FSPagerViewDataSource

extension ImagePagerView: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return itemModel.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        guard let url = URL(string: itemModel[index].image?.url ?? "") else { return FSPagerViewCell() }
        
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.kf.setImage(with: url)
        cell.imageView?.contentMode = .scaleAspectFit
        return cell
    }
}

// MARK: - FSPagerViewDelegate

extension ImagePagerView: FSPagerViewDelegate {
    
}
