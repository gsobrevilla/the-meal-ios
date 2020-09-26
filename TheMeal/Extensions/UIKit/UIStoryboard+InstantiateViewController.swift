//
//  UIStoryboard+InstantiateViewController.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    static func instantiate(viewController viewControllerName: String, from appStoryboard: AppStoryboard) -> UIViewController {
        return UIStoryboard(name: appStoryboard.rawValue, bundle: .main).instantiateViewController(withIdentifier: viewControllerName)
    }
}
