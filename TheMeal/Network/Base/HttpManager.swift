//
//  HttpManager.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import Reqres
import Alamofire

class HttpManager: Alamofire.SessionManager {
    
    static let shared: HttpManager = {
        let configuration = Reqres.defaultSessionConfiguration()
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 30
        let manager = HttpManager(configuration: configuration)
        manager.adapter = NetworkRequestManager()
        manager.retrier = NetworkRequestManager()
        return manager
    }()
}
