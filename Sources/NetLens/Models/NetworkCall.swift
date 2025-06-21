//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 21/06/2025.
//

import Foundation

public struct NetworkCall {
    public let id = UUID()
    
    public let url: URL
    
    public let method: String
    
    public let headers: [String: String]
    
    public let requestBody: Data?
    
    public let responseBody: Data?
    
    public let statusCode: Int?
    
    public let timeStamp: Date
    
    public let duration: TimeInterval?
    
    public let error: Error?
    
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
        return String(format: "%.2f", duration)
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

