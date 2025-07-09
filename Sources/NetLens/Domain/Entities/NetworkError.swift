//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 21/06/2025.
//

import Foundation

@frozen
public enum NetworkError: Error, Sendable {
    case invalidURL
    case noResponse
    case networkFailure(String)
    case decodingError
    case timeout
    case unknown
}
