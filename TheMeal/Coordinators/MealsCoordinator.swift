//
//  MealsCoordinator.swift
//  TheMeal
//
//  Created by Gastón on 07/01/2021.
//  Copyright © 2021 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import UIKit

class MealsCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(clearingStack: Bool, animated: Bool) {
        let listVC = instantiateMealsListViewController()
        if clearingStack {
            navigationController.setViewControllers([listVC], animated: animated)
        } else {
            navigationController.pushViewController(listVC, animated: animated)
        }
    }
    
    func openDetailForMeal(withId mealId: String) {
        let vc = instantiateMealDetailsViewController(mealId: mealId)
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func instantiateMealsListViewController() -> MealsListViewController {
        let vc = MealsListViewController.instantiateFromStoryboard()
        let presenter = MealsListPresenter(view: vc, coordinator: self)
        vc.presenter = presenter
        return vc
    }
    
    private func instantiateMealDetailsViewController(mealId: String) -> UIViewController {
        let vc = MealDetailsViewController.instantiateFromStoryboard()
        let presenter = MealDetailsPresenter(view: vc, mealId: mealId)
        vc.presenter = presenter
        return vc
    }
}
