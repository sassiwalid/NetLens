//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 09/07/2025.
//

import Foundation

extension NetworkRequestDTO {
    init (from request: URLRequest) {
        self.init(
            url: request.url?.absoluteString ?? "",
            method: request.httpMethod ?? "GET",
            headers: request.allHTTPHeaderFields ?? [:],
            body: request.httpBody
        )
    }
}

