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
}

class MealsListPresenter: MealsListPresenterProtocol {
    
    private weak var view: MealsListViewProtocol?
    
    private var mockedItems = [MealsListItemViewModel(
        pictureUrl: "https://www.themealdb.com/images/media/meals/58oia61564916529.jpg",
        name: "first",
        category: "Side"
    ),
    MealsListItemViewModel(
        pictureUrl: "https://www.themealdb.com/images/media/meals/58oia61564916529.jpg",
        name: "second",
        category: "Side"
    ),
    MealsListItemViewModel(
        pictureUrl: "https://www.themealdb.com/images/media/meals/58oia61564916529.jpg",
        name: "third",
        category: "Side"
    ),
    MealsListItemViewModel(
        pictureUrl: "https://www.themealdb.com/images/media/meals/58oia61564916529.jpg",
        name: "fourth https://www.themea https://www.themea  https://www.themea https://www.themea ",
        category: "Side https://www.themea https://www.themea https://www.themea https://www.themea https://www.themea https://www.themea https://www.themea https://www.themea https://www.themea"
    )]
    
    init(view: MealsListViewProtocol) {
        self.view = view
    }
    
    func fetchInitialData() {
        view?.updateList(items: mockedItems)
    }
    
    func fetchDataWithSearch(query: String) {
        let items = mockedItems.filter({ $0.name.contains(query) })
        view?.updateList(items: items)
    }
}
