//
//  APIRequestFactory.swift
//  GenericAPISolution
//
//  Created by Harish on 04/07/23.
//

import Foundation

protocol APIRequest {
    var baseURL: String { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    var body: Data? { get }
    var method: HTTPMethod { get }
}

protocol APIRequestFactoryProtocol {
    func createAPIRequest(request: APIRequest) throws -> URLRequest
}

class APIRequestFactory: APIRequestFactoryProtocol {
    func createAPIRequest(request: APIRequest) throws -> URLRequest {
        
        guard let url = URL(string: request.baseURL) else {
            throw APIError.malformedURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        if request.method == .post {
            urlRequest.httpBody = request.body
        }
        
        return urlRequest
    }
}
