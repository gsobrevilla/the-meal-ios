//
//  MealsRouter.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import UIKit

class MealsRouter {
    
    static func navigateToMealsList(from context: UIViewController) {
        let vc = instantiateMealsListViewController()
        context.navigationController?.pushViewController(vc, animated: true)
    }
    
    private static func instantiateMealsListViewController() -> UIViewController {
        let vc = MealsListViewController.instantiateFromStoryboard()
        let presenter = MealsListPresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
}
