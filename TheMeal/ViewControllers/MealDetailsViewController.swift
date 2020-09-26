//
//  MealDetailsViewController.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import UIKit
import youtube_ios_player_helper

protocol MealDetailsPresenterProtocol {
    
    func fetchInitialData()
}

class MealDetailsViewController: UIViewController, InstantiableFromStoryboard {
    
    // MARK: Static Properties
    
    static var appStoryboard: AppStoryboard = .meals
    
    // MARK: - Outlets
    
    @IBOutlet private var nameLabel: UILabel?
    @IBOutlet private var categoryLabel: UILabel?
    @IBOutlet private var youtubePlayerView: YTPlayerView?
    @IBOutlet private var instructionsLabel: UILabel?
    @IBOutlet private var ingredientsStackView: UIStackView?
    
    // MARK: - Properties
    
    var presenter: MealDetailsPresenterProtocol?
    
    private var viewModel: MealDetailsViewModel? {
        didSet {
            updateUIFromViewModel()
        }
    }
    
    private var loadingOverlay = LoadingOverlay()
    
    // MARK: - Callbacks
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        buildInitialViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadingOverlay.show(over: view)
        presenter?.fetchInitialData()
    }
    
    // MARK: - UI Initial setup
    
    private func setupNavigationBar() {
        navigationItem.title = "Details"
    }
    
    // MARK: - View Model
    
    private func buildInitialViewModel() {
        viewModel = MealDetailsViewModel(
            name: "...",
            category: "...",
            instructions: "...",
            ingredients: ["...","...."],
            youtubeVideoId: nil)
    }
    
    private func updateUIFromViewModel() {
        nameLabel?.text = viewModel?.name
        categoryLabel?.text = viewModel?.category
        
        if let videoId = viewModel?.youtubeVideoId {
            youtubePlayerView?.load(withVideoId: videoId)
        }
        
        instructionsLabel?.text = viewModel?.instructions
        
        ingredientsStackView?.arrangedSubviews.forEach({ (subview) in
            ingredientsStackView?.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        })
        viewModel?.ingredients.forEach({ (ingredient) in
            ingredientsStackView?.addArrangedSubview(buildLabelForIngredient(ingredient))
        })
    }
    
    private func buildLabelForIngredient(_ ingredient: String) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .darkGray
        label.text = "• \(ingredient)"
        return label
    }
}

extension MealDetailsViewController: MealDetailsViewProtocol  {
    
    func updateView(viewModel: MealDetailsViewModel) {
        self.viewModel = viewModel
        loadingOverlay.hide()
    }
    
    func showDataFetchError(_ message: String) {
        loadingOverlay.hide()
        showOkDialog(title: "", message: message)
    }
}
