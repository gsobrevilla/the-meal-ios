//
//  MealsRepository.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire

class MealsRepository: ApiRepository {
    
    typealias MealsCompletion = (_ success: Bool, _ meals: [Meal]?) -> Void
    
    typealias MealCompletion = (_ success: Bool, _ meal: Meal?) -> Void
    
    func search(query: String, completion: @escaping MealsCompletion) {
        requestBuilder.searchMeals(query: query).responseObject {
            (response: DataResponse<MealsListResponse>) in
            
            switch response.result {
            case .success(let value):
                completion(true, value.meals)
            case .failure:
                completion(false, nil)
            }
        }
    }
    
    func get(id: String, completion: @escaping MealCompletion) {
        requestBuilder.getMealDetails(id: id).responseObject {
            (response: DataResponse<MealsListResponse>) in
            
            switch response.result {
            case .success(let value):
                completion(true, value.meals.first)
            case .failure:
                completion(false, nil)
            }
        }
    }
}
