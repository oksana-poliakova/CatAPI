//
//  ListViewController.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 26.07.2022.
//

import UIKit

// MARK: - Basic class for Breeds and Categories

class ListViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
        return tableView
    }()
    
    private var items: [ItemModel] = []
    var service: ItemsNetworkService?
    private let cellID = "ListTableViewCell"

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
        getCategories()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - Getting data
    
    private func getCategories() {
        service?.fetch { [weak self] items in
            self?.items = items
            self?.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configureCell(item: items[indexPath.row])
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].select()
    }
}

// MARK: - Select Breed

extension UIViewController {
    func select(breed: BreedElement) {
        let vc = BreedDescriptionViewController()
        show(vc, sender: self)
    }
}

// MARK: - Select Category

extension UIViewController {
    func select(category: CategoryElement) {
        let vc = PhotoGalleryViewController()
        let service = ImageNetworkServiceAdapter(api: NetworkManager.shared, endpoint: Endpoint.imageByCategoryID + "\(category.id)")
        vc.service = service
        show(vc, sender: self)
    }
}
