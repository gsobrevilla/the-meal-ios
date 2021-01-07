//
//  InitialCoordinator.swift
//  TheMeal
//
//  Created by Gastón on 07/01/2021.
//  Copyright © 2021 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import UIKit

class InitialCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        HomeCoordinator(navigationController: navigationController).start()
    }
}
