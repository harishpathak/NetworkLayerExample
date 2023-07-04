//
//  EmployeeService.swift
//  GenericAPISolution
//
//  Created by Harish on 04/07/23.
//

import Foundation

protocol EmployeeAPI {
    func getEmployee(by id: String) async throws -> Employee
}

class EmployeeService: EmployeeAPI {
    let client: APIClient = HTTPAPIClient(session: URLSession.shared)
    let factory: APIRequestFactoryProtocol = APIRequestFactory()
    
    func getEmployee(by id: String) async throws -> Employee {
        return try await client.fetch(for: factory.createAPIRequest(request: EmployeeAPIRequest()))
    }
}
