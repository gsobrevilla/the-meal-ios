//
//  Meal.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import ObjectMapper

class Meal: Mappable {
    
    var thumbUrl: String?
    var name: String?
    var category: String?
    
    init() {}
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        thumbUrl <- map["strMealThumb"]
        name <- map["strMeal"]
        category  <- map["strCategory"]
    }
}
