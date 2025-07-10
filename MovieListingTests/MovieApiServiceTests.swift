//
//  MovieApiServiceTests.swift
//  MovieListingTests
//
//  Created by NATHIYA on 10/07/25.
//

import XCTest

final class MovieApiServiceTests: XCTestCase {

    func testFetchMovies_Success() async throws {
            // Arrange
            let mockSession = MockURLSession()
            let expectedMovies: [Movie] = JSONLoader.load(LocalJsonFile.list.rawValue, type: [Movie].self, bundle: Bundle(for: Self.self))
            let jsonData = try JSONEncoder().encode(expectedMovies)

            mockSession.mockData = jsonData
            mockSession.mockResponse = HTTPURLResponse(
                url: URL(string: "https://example.com")!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )

            let service = MovieApiService(session: mockSession)

            // Act
            let result = try await service.fetchMovies()

            // Assert
            XCTAssertEqual(result.count, expectedMovies.count)
            XCTAssertEqual(result.first?.primaryTitle, "The Shawshank Redemption")
        }

        func testFetchMovieDetails_Success() async throws {
            // Arrange
            let mockSession = MockURLSession()
            let expectedMovie: Movie = JSONLoader.load(LocalJsonFile.details.rawValue, type: Movie.self, bundle: Bundle(for: Self.self))
            let jsonData = try JSONEncoder().encode(expectedMovie)

            mockSession.mockData = jsonData
            mockSession.mockResponse = HTTPURLResponse(
                url: URL(string: "https://example.com")!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )

            let service = MovieApiService(session: mockSession)

            // Act
            let result = try await service.fetchMovieDetails(id: "tt0816692")

            // Assert
            XCTAssertNotNil(result)
            XCTAssertEqual(result?.primaryTitle, "Interstellar")
        }

        func testFetchMovies_Failure() async {
            // Arrange
            let mockSession = MockURLSession()
            mockSession.mockData = nil
            mockSession.mockResponse = nil

            let service = MovieApiService(session: mockSession)

            do {
                _ = try await service.fetchMovies()
                XCTFail("Expected failure")
            } catch {
                XCTAssertTrue(error is URLError)
            }
        }
    
    func testFetchMovieDetails_Failure() async {
        // Arrange
        let mockSession = MockURLSession()
        mockSession.mockData = nil
        mockSession.mockResponse = nil
        
        let service = MovieApiService(session: mockSession)
        
        do {
            _ = try await service.fetchMovieDetails(id: testMovieId)
            XCTFail("Expected failure")
        } catch {
            XCTAssertTrue(error is URLError)
        }
    }

}
