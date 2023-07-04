//
//  UsersAPIRequest.swift
//  GenericAPISolution
//
//  Created by Harish on 04/07/23.
//

import Foundation

struct UsersAPIRequest: APIRequest {
    var baseURL: String = "https://example.com"
    
    var path: String = "allUsers"
    
    var parameters: [String : Any]?
    
    var method: HTTPMethod = .get
    
    var body: Data?
}
