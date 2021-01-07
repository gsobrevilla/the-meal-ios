//
//  AppStoryboard.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation

class AppStoryboard {
    
    static var main: AppStoryboard {
        return AppStoryboard(storyboardName: "Main")
    }
    
    let storyboardName: String
    
    init(storyboardName: String) {
        self.storyboardName = storyboardName
    }
}
