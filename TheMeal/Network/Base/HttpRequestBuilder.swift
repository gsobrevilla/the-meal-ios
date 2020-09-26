//
//  HttpRequestBuilder.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class HttpRequestBuilder {
    
    let baseUrl: String
    let defaultSessionManager: SessionManager
    var encodingForGetRequests: ParameterEncoding = URLEncoding.queryString
    var encodingForOtherRequests: ParameterEncoding = Alamofire.JSONEncoding.default
    
    init(baseUrl: String, defaultSessionManager: SessionManager) {
        self.baseUrl = baseUrl
        self.defaultSessionManager = defaultSessionManager
    }
    
    func buildRequest(path: String, method: Alamofire.HTTPMethod) -> DataRequest {
        return buildRequest(path: path, method: method, params: [:])
    }
    
    func buildRequest(path: String, method: Alamofire.HTTPMethod, params: Mappable) -> DataRequest {
        return buildRequest(path: path, method: method, params: params.toJSON())
    }
    
    func buildRequest(path: String, method: Alamofire.HTTPMethod, params: Parameters) -> DataRequest {
        return buildRequest(manager: defaultSessionManager, path: path, method: method, params: params)
    }
    
    func buildRequest(manager: SessionManager, path: String, method: Alamofire.HTTPMethod, params: Parameters) -> DataRequest {
        return manager.request(getCompleteUrl(path: path),
                               method: method,
                               parameters: params,
                               encoding: getEncoding(forMethod: method),
                               headers: getHTTPHeaders(forPath: path)).validate()
    }
    
    func getCompleteUrl(path: String) -> String {
        return baseUrl + path
    }
    
    func getEncoding(forMethod method: Alamofire.HTTPMethod) -> ParameterEncoding {
        if method == .get {
            return encodingForGetRequests
        } else {
            return encodingForOtherRequests
        }
    }
    
    func getHTTPHeaders(forPath path: String) -> HTTPHeaders {
        return [:]
    }
}
