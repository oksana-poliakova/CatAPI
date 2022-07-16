//
//  BreedsViewController.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 11.07.2022.
//

import UIKit

class BreedsViewController: UIViewController {

    // MARK: - Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BreedsTableViewCell.self, forCellReuseIdentifier: "BreedsTableViewCell")
        return tableView
    }()
    
    private let cellID = "BreedsTableViewCell"
    private var breed: Breed?

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
        getBreeds()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        title = "List of Breeds"
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - Getting data
    
    private func getBreeds() {
        NetworkManager.shared.fetchBreeds { [weak self] result in
            switch result {
            case .success(let breed):
                self?.breed = breed
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension BreedsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        breed?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? BreedsTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configureCell(breed: breed?[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension BreedsViewController: UITableViewDelegate {
    
}
