//
//  EmployeeAPIRequest.swift
//  GenericAPISolution
//
//  Created by Harish on 04/07/23.
//

import Foundation

struct EmployeeAPIRequest: APIRequest {
    var baseURL: String = "https://example.com"
    
    var path: String = "employees"
    
    var parameters: [String : Any]? {
        return ["id": 2]
    }
    
    var method: HTTPMethod = .get
    
    var body: Data?
}
