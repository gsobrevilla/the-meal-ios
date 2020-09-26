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
    
    var id: String?
    var thumbUrl: String?
    var name: String?
    var category: String?
    var instructions: String?
    var ingredients: [String] = []
    var youtubeVideoUrl: String?
    
    var youtubeVideoId: String? {
        guard let youtubeVideoUrl = youtubeVideoUrl else { return nil }
        guard let urlComponents = URLComponents(string: youtubeVideoUrl) else { return nil }
        return urlComponents.queryItems?.first(where: { $0.name == "v" })?.value
    }
    
    init() {}
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        id <- map["idMeal"]
        thumbUrl <- map["strMealThumb"]
        name <- map["strMeal"]
        category  <- map["strCategory"]
        instructions <- map["strInstructions"]
        youtubeVideoUrl <- map["strYoutube"]
        
        ingredients = []
        (1...20).forEach { (number) in
            if let ingredient = map["strIngredient\(number)"].currentValue as? String, !ingredient.isEmpty {
                ingredients.append(ingredient)
            }
        }
    }
}
