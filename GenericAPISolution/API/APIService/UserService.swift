//
//  UserService.swift
//  GenericAPISolution
//
//  Created by Harish on 04/07/23.
//

import Foundation

protocol UserAPI {
    func getUsers() async throws -> [User]
}

class UserService: UserAPI {
    
    let client: APIClient = HTTPAPIClient(session: URLSession.shared)
    let factory: APIRequestFactoryProtocol = APIRequestFactory()
    
    func getUsers() async throws -> [User] {
        return try await client.fetch(for: factory.createAPIRequest(request: UsersAPIRequest()))
    }
}
