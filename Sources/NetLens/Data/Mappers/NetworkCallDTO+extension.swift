//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 09/07/2025.
//
import Foundation

extension NetworkCallDTO {
    func toDomain() -> NetworkCall? {
        guard let url = URL(string: self.url) else {
            return nil
        }

        let httpMethod = HTTPMethod(rawValue: self.method) ?? .GET

        let duration: Duration? = {
            guard let timeInterval = self.duration else { return nil }
            return Duration.seconds(timeInterval)
        }()

        let networkError: NetworkError? = {
            guard let errorString = self.error else { return nil }
            return .networkFailure(errorString)
        }()

        return NetworkCall(
            url: url,
            method: httpMethod,
            headers: headers,
            requestBody: requestBody,
            responseBody: responseBody,
            statusCode: statusCode,
            timeStamp: timeStamp,
            duration: duration,
            error: networkError
        )
    }
}

