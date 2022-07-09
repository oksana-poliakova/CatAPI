//
//  StartScreenViewController.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 09.07.2022.
//

import UIKit

final class StartScreenViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(StartScreenTableViewCell.self, forCellReuseIdentifier: cellID)
        return tableView
    }()
    
    private let refreshControl = UIRefreshControl()
    private let sideConstraint: CGFloat = 16.0
    private let cellID = "StartScreenViewController"

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
        
        setupUI()
        updateContent()
        pullToRefresh()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = .white
        
        /// Appearance
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        /// Constraints
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sideConstraint),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sideConstraint),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - Refresh control
    
    func updateContent() {
        tableView.reloadData()
    }
    
    private func pullToRefresh() {
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh() {
        updateContent()
        refreshControl.endRefreshing()
    }
}

// MARK: - UITableViewDelegate

extension StartScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "List of Cat Breeds"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

// MARK: - UITableViewDataSource

extension StartScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? StartScreenTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        return cell
    }
}
