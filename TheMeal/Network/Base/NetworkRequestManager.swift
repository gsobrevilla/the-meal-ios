//
//  NetworkRequestManager.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import Alamofire
import Reqres

class NetworkRequestManager {
    var sessionManager: SessionManager!
    var retryRequest: DataRequest!
}

extension NetworkRequestManager: RequestAdapter {
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        return urlRequest
    }
}

extension NetworkRequestManager: RequestRetrier {

    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        completion(true, 0.0)
    }
}

