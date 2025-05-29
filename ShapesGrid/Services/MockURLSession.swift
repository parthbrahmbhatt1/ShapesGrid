//
//  MockURLSession.swift
//  ShapesGrid
//
//  Created by Parth Brahmbhatt on 5/28/25.
//

import Foundation

class MockURLSession: URLSessionProtocol {
    var testData: Data = Data()
    var testResponse: URLResponse = URLResponse()
    
    func data(from url: URL) async throws -> (Data, URLResponse) {
        return(testData, testResponse)
    }
}
