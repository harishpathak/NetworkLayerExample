//
//  HTTPClient.swift
//  GenericAPISolution
//
//  Created by Harish on 14/06/23.
//

import Foundation

protocol APIClient {
    func fetch<T: Codable>(for request: URLRequest) async throws -> T
}

protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}

enum APIError: Error {
    case badRequest
    case malformedURL
    case badResponse
    case notFetched
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

class HTTPAPIClient: APIClient {
    private var session: URLSessionProtocol
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    func fetch<T>(for request: URLRequest) async throws -> T where T : Decodable, T : Encodable {
        
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.badResponse
            }
            
            if httpResponse.statusCode == 200 {
                return try JSONDecoder().decode(T.self, from: data)
                
            } else {
                throw APIError.notFetched
            }
        }
    }
    
}


