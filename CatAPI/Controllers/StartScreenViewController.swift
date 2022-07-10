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
        imageView.contentMode = .scaleAspectFit
        return imageView
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
    
    // MARK: - Getting data
    
    private func getData() {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let response = response {
                print(response)
            }
            
            if let error = error {
                print(error)
            }
            
            do {
                guard let data = data else { return }
                
                let json = try JSONDecoder().decode(Posts.self, from: data)
                print(json)
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    private func getBackgroundImage() {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search") else { return }
        
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

