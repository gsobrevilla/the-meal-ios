//
//  MealDetailsPresenter.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation

protocol MealDetailsViewProtocol: class {
    func updateView(viewModel: MealDetailsViewModel)
    func showDataFetchError(_ message: String)
}

class MealDetailsPresenter: MealDetailsPresenterProtocol {
    
    private weak var view: MealDetailsViewProtocol?
    private let mealId: String
    private let repository = MealsRepository()
    
    init(view: MealDetailsViewProtocol, mealId: String) {
        self.view = view
        self.mealId = mealId
    }
    
    func fetchInitialData() {
        repository.get(id: mealId) { [weak self] (success, meal) in
            guard success, let meal = meal else {
                self?.view?.showDataFetchError("Error retrieving the meal")
                return
            }
            
            self?.view?.updateView(viewModel: meal.mealDetailsViewModel)
        }
    }
}

fileprivate extension Meal {
    
    var mealDetailsViewModel: MealDetailsViewModel {
        return MealDetailsViewModel(
            name: name ?? "",
            category: category ?? "",
            instructions: instructions ?? "",
            ingredients: ingredients)
    }
}
