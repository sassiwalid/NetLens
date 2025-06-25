//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 25/06/2025.
//

@testable import NetLens

import Foundation

class NetworkCallFactory {
    
    static func makeSuccessCall(
        url: String = "https://www.api.test.com/success",
        method: HTTPMethod = .GET
    ) -> NetworkCall {
        NetworkCall(
            url: URL(string: url)!,
            method: method,
            statusCode: 200,
            timeStamp: Date(),
            duration: .milliseconds(500)
        )
    }
    
    static func makeFailedCall(
        url: String = "https://www.api.test.com/success",
        method: HTTPMethod = .GET,
        statusCode: Int = 400
    ) -> NetworkCall {
        NetworkCall(
            url: URL(string: url)!,
            method: method,
            statusCode: statusCode,
            timeStamp: Date(),
            duration: .seconds(1),
            error: NetworkError(
                code: statusCode,
                message: "Not Found"
            )
        )
    }
}

