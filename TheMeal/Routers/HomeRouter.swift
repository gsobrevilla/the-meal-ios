//
//  HomeRouter.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter {
    
    static func setHome(from context: UIViewController) {
        MealsRouter.navigateToMealsList(from: context, clearingNavigationStack: true)
    }
}
