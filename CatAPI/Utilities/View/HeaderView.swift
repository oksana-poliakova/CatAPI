//
//  CatPageControl.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 09.07.2022.
//

// ***
// This component will be finished a little later...
// ***

import UIKit

final class HeaderView: UIView {
    
    // MARK: - Properties
    
    private let pageControl = UIPageControl(frame: .zero)
    private var pageController: UIPageViewController?
    private var containerControllers: [ImageContainerViewController?] = []
    private var currentIndex: Int = 0

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        
        setupPageControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup page control
    
    private func setupPageControl() {
        guard let pageController = pageController else {
            return
        }

        [pageController.view, pageControl].forEach {
            addSubview($0)
        }
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .blue.withAlphaComponent(0.8)
        pageControl.numberOfPages = 5
        pageControl.currentPage = 1
        
        NSLayoutConstraint.activate([
            pageController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageController.view.topAnchor.constraint(equalTo: topAnchor),
            pageController.view.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            pageControl.bottomAnchor.constraint(equalTo: pageController.view.bottomAnchor, constant: -50),
            pageControl.leadingAnchor.constraint(equalTo: pageController.view.leadingAnchor, constant: 20),
            pageControl.trailingAnchor.constraint(equalTo: pageController.view.trailingAnchor, constant: -20)
        ])
    }
}
