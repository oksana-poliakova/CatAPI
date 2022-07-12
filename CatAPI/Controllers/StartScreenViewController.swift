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
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let refreshControl = UIRefreshControl()
    private let sideConstraint: CGFloat = 16.0
    private let cellID = "StartScreenViewController"
    private var post: Post? = nil

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
        getData()
        getBackgroundImage()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = .white
        
        /// Appearance
        [backgroundImage, tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        /// Constraints
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sideConstraint),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sideConstraint),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 150)
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
    
    // MARK: - Getting data
    
    private func getData() {
        NetworkManager.shared.fetchPostImages { [weak self] post in
            self?.post = post
            self?.getBackgroundImage()
        }
    }
    
    private func getBackgroundImage() {
        guard
            let stringUrl = post?.url,
            let url = URL(string: stringUrl)
        else {
            return
        }
        
        backgroundImage.load(url: url)
    }
}

// MARK: - UIImageView

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
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

