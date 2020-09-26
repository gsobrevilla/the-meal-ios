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
    func updateRandomMeal(pictureUrl: String?)
    func showDataFetchError(_ message: String)
    func navigateToDetailForMeal(withId mealId: String)
}

class MealsListPresenter: MealsListPresenterProtocol {
    
    private weak var view: MealsListViewProtocol?
    
    private let repository = MealsRepository()
    
    private var lastSearchQuery: String?
    private var randomMealTime: Timer?
    
    private var meals: [Meal] = []
    private var randomMeal: Meal?
    
    init(view: MealsListViewProtocol) {
        self.view = view
    }
    
    func fetchInitialData() {
        fetchDataWithSearch(query: "")
        requestRandomMeal()
    }
    
    func fetchDataWithSearch(query: String) {
        lastSearchQuery = query
        repository.search(query: query) { [weak self] (success, meals, query) in
            guard query == self?.lastSearchQuery else {
                return
            }
            
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
    
    private func requestRandomMeal() {
        randomMealTime?.invalidate()
        randomMealTime = Timer.scheduledTimer(withTimeInterval: 30, repeats: false, block: { [weak self] (timer) in
            self?.requestRandomMeal()
        })
        
        repository.getRandom { [weak self] (success, meal) in
            guard success, let meal = meal else {
                return
            }
            
            self?.randomMeal = meal
            self?.view?.updateRandomMeal(pictureUrl: meal.thumbUrl)
        }
    }
    
    func selectBanner() {
        if let id = randomMeal?.id {
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
