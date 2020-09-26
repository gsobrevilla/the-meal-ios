//
//  MealsListPresenter.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation

protocol MealsListViewProtocol: class {
    func updateList(items: [MealsListItemViewModel])
    func showDataFetchError(_ message: String)
    func navigateToDetailForMeal(withId mealId: String)
}

class MealsListPresenter: MealsListPresenterProtocol {
    
    private weak var view: MealsListViewProtocol?
    private let repository = MealsRepository()
    private var meals: [Meal] = []
    
    init(view: MealsListViewProtocol) {
        self.view = view
    }
    
    func fetchInitialData() {
        fetchDataWithSearch(query: "")
    }
    
    func fetchDataWithSearch(query: String) {
        repository.search(query: query) { [weak self] (success, meals) in
            guard success, let meals = meals else {
                self?.view?.showDataFetchError("Error retrieving the meals")
                return
            }
            
            self?.meals = meals
            let items = meals.map({ $0.mealListItemViewModel })
            self?.view?.updateList(items: items)
        }
    }
    
    func selectItem(at index: Int) {
        let meal = meals[index]
        if let id = meal.id {
            view?.navigateToDetailForMeal(withId: id)
        }
    }
}

fileprivate extension Meal {
    
    var mealListItemViewModel: MealsListItemViewModel {
        return MealsListItemViewModel(
            pictureUrl: thumbUrl,
            name: name ?? "",
            category: category ?? "")
    }
}
