//
//  BreedListViewController.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 02.08.2022.
//

import UIKit

final class BreedListViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BreedListTableViewCell.self, forCellReuseIdentifier: "BreedListTableViewCell")
        return tableView
    }()
    
    private var viewModel: BreedListViewModel?

    // MARK: - Init
    
    init(viewModel: BreedListViewModel?) {
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.fetchItems()
        setupUI()
    }
    
    func reloadData() {
        tableView.reloadData()
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
}

// MARK: - UITableViewDataSource

extension BreedListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.countOfItems() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let viewModel = viewModel,
            let cell = tableView.dequeueReusableCell(withIdentifier: "BreedListTableViewCell", for: indexPath) as? BreedListTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.configureCell(item: viewModel.indexPerItem(indexPath: indexPath))
        return cell
    }

}

// MARK: - UITableViewDelegate

extension BreedListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (viewModel?.countOfItems() ?? 0) - 1 {
            viewModel?.fetchItems(pagination: true)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let breed = viewModel?.indexPerItem(indexPath: indexPath) else { return }
        
        let helper = CatsNetworkServiceHelper(api: NetworkManager.shared,
                                              breedID: breed.id)
        let viewModel = BreedDescriptionViewModel(breed: breed, helper: helper)
        let vc = BreedDescriptionViewController(viewModel: viewModel)
        viewModel.rootViewController = vc
        navigationController?.pushViewController(vc, animated: true)
    }
}




