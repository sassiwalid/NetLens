//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 09/07/2025.
//

import Foundation

extension NetworkResponseDTO {

    init(
        from urlResponse: URLResponse,
        data: Data?
    ) {
        let headers: [String: String]

        if let httpResponse = urlResponse as? HTTPURLResponse {
            headers = httpResponse.allHeaderFields.reduce(into: [String: String]()) { result, entry in
                if let key = entry.key as? String {
                    result[key] = "\(entry.value)"
                }
            }
        } else {
            headers = [:]
        }

        self.init(
            statusCode: (urlResponse as? HTTPURLResponse)?.statusCode ?? 0,
            headers: headers,
            body: data
        )
    }
}


