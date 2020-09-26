//
//  AppStoryboard.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation

enum AppStoryboard: String {
    
    case main = "Main"
    case meals = "Meals"
    
    var storyboardName: String {
        return rawValue
    }
}
