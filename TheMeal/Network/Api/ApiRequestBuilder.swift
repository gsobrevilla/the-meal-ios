//
//  ApiRequestBuilder.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import Alamofire

class ApiRequestBuilder: HttpRequestBuilder {
    
    func searchMeals(query: String) -> DataRequest {
        let params = ["s": query]
        return buildRequest(path: ApiEndpoints.search, method: .get, params: params)
    }
}
