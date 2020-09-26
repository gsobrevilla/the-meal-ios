//
//  MealsListResponse.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import ObjectMapper

class MealsListResponse: Mappable {
    
    var meals: [Meal] = []
    
    init() {}
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        meals <- map["meals"]
    }
}
