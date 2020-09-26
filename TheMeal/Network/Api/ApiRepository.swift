//
//  ApiRepository.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation

class ApiRepository: HttpRepository<ApiRequestBuilder> {
    
    let baseUrl: String = "https://www.themealdb.com/api/json/v1/1/"
    
    init() {
        let requestBiulder = ApiRequestBuilder(
            baseUrl: baseUrl,
            defaultSessionManager: HttpManager.shared)
        super.init(requestBuilder: requestBiulder)
    }
}
