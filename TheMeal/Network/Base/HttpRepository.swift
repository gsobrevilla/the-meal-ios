//
//  HttpRepository.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class HttpRepository<T: HttpRequestBuilder> {
        
    let requestBuilder: T
    
    init(requestBuilder: T) {
        self.requestBuilder = requestBuilder
    }
}
