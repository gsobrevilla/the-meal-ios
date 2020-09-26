//
//  MealsListViewController.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import UIKit

protocol MealsListPresenterProtocol {
    func fetchInitialData()
    func fetchDataWithSearch(query: String)
}

class MealsListViewController: UIViewController, InstantiableFromStoryboard {
    
    static var appStoryboard: AppStoryboard = .meals
    
    @IBOutlet private var searchBar: UISearchBar?
    @IBOutlet private var tableView: UITableView?
    
    private var presenter: MealsListPresenterProtocol?
    
    private var items: [MealsListItemViewModel] = [
        MealsListItemViewModel(
            pictureUrl: "https://www.themealdb.com/images/media/meals/58oia61564916529.jpg",
            name: "Corba",
            category: "Side"
        ),
        MealsListItemViewModel(
            pictureUrl: "https://www.themealdb.com/images/media/meals/58oia61564916529.jpg",
            name: "Corba",
            category: "Side"
        ),
        MealsListItemViewModel(
            pictureUrl: "https://www.themealdb.com/images/media/meals/58oia61564916529.jpg",
            name: "Corba",
            category: "Side"
        ),
        MealsListItemViewModel(
            pictureUrl: "https://www.themealdb.com/images/media/meals/58oia61564916529.jpg",
            name: "Corba https://www.themea https://www.themea  https://www.themea https://www.themea ",
            category: "Side https://www.themea https://www.themea https://www.themea https://www.themea https://www.themea https://www.themea https://www.themea https://www.themea https://www.themea"
        )
    ]
    
    private var searchDelay: TimeInterval = 0.3
    private var searchTimer: Timer?
    
    
    
    // MARK: - Callbacks
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSearchBar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchInitialData()
    }
    
    // MARK: - UI Initial setup
    
    private func setupNavigationBar() {
        navigationItem.title = "The Meal DB"
    }
    
    private func setupSearchBar() {
        searchBar?.delegate = self
    }
    
    private func setupTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
        tableView?.register(UINib(nibName: "MealsListCell", bundle: .main), forCellReuseIdentifier: "cell")
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    // MARK: - Searching
    
    private func searchQueryChanged() {
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: searchDelay, repeats: false, block: { [weak self] (timer) in
            self?.performSearch()
        })
    }
    
    private func performSearch() {
        let query = searchBar?.text ?? ""
        presenter?.fetchDataWithSearch(query: query)
    }
}

extension MealsListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchQueryChanged()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension MealsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MealsListCell else {
            return UITableViewCell()
        }
        
        let item = items[indexPath.row]
        cell.selectionStyle = .gray
        cell.viewModel = item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
