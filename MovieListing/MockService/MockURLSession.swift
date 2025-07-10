//
//  MockURLSession.swift
//  MovieListing
//
//  Created by NATHIYA on 10/07/25.
//

import Foundation

protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

class MockURLSession: URLSessionProtocol {
    var mockData: Data?
    var mockResponse: URLResponse?

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        guard let data = mockData, let response = mockResponse else {
            throw URLError(.badServerResponse)
        }
        return (data, response)
    }
}

extension URLSession: URLSessionProtocol {}
