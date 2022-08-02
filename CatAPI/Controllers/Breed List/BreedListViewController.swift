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
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "BreedListTableViewCell")
        return tableView
    }()
    
    private var viewModel: BreedListViewModel?
    private var breeds: [BreedElement] = []
    

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
        breeds.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BreedListTableViewCell", for: indexPath) as? BreedListTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configureCell(item: breeds[indexPath.row])
        return cell
    }

}

// MARK: - UITableViewDelegate

extension BreedListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == breeds.count - 1 {
//            service?.fetch(completion: { [weak self] items in
//                self?.items.append(contentsOf: items)
//                tableView.reloadData()
//            })
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}

// MARK: - Select Breed

//extension ListViewController {
//    func select(breed: BreedElement) {
//        let vc = BreedDescriptionViewController()
//        let service = CatsNetworkServiceAdapter(api: NetworkManager.shared, breedID: breed.id)
//        vc.service = service
//        show(vc, sender: self)
//    }
//}


