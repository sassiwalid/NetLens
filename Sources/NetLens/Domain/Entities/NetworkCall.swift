//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 21/06/2025.
//

import Foundation
@frozen
public struct NetworkCall: Sendable, Identifiable {

    public let id = UUID()

    public let timeStamp: Date

    public let url: URL

    // Request properties

    public let method: HTTPMethod

    public let headers: [String: String]

    public let requestBody: Data?

    // Response properties

    public let responseBody: Data?

    public let statusCode: Int?

    public let duration: Duration?

    public let error: NetworkError?

    // MARK: - Life Cycle

    public init(
    url: URL,
    method: HTTPMethod,
    headers: [String: String] = [:],
    requestBody: Data? = nil,
    responseBody: Data? = nil,
    statusCode: Int? = nil,
    timeStamp: Date = Date(),
    duration: Duration? = nil,
    error: NetworkError? = nil
    ) {

        self.url = url

        self.method = method

        self.headers = headers

        self.requestBody = requestBody

        self.responseBody = responseBody

        self.statusCode = statusCode

        self.timeStamp = timeStamp

        self.duration = duration

        self.error = error

    }
    
}

extension NetworkCall {

    public var isSucessful: Bool {
        guard let statusCode = statusCode else {
            return false
        }
        return statusCode >= 200 && statusCode < 300
    }
    
    public var displayDuration: String {
        guard let duration = duration else {
            return "N/A"
        }

        let seconds = Double(duration.components.seconds) +
        Double(duration.components.attoseconds) / 1e18
        
        return String(format: "%.2fs", seconds)
    }
    
    public var displaySize: String {
        guard let responseBodyData = responseBody else {
            return "N/A"
        }
        let sizeInBytes = Double(responseBodyData.count)
        let sizeInKB = sizeInBytes / 1024
        return String(format: "%.2f KB", sizeInKB)
    }
}

struct NetworkRequest: Sendable {
    let url: String
    let method: String
    let headers: [String: String]
    let body: Data?
}

struct NetworkResponse: Sendable {
    let statusCode: Int
    let headers: [String: String]
    let body: Data?
}

