//
//  InstantiableFromStoryboard.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import UIKit

protocol InstantiableFromStoryboard where Self: UIViewController {
    static var appStoryboard: AppStoryboard { get }
}

extension InstantiableFromStoryboard {
    static var appStoryboard: AppStoryboard { return .main }
    
    static func instantiateFromStoryboard() -> Self {
        return UIStoryboard.instantiate(viewController: String(describing: self), from: appStoryboard) as! Self
    }
}
