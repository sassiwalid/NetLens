//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 09/07/2025.
//

import Foundation

struct NetworkCallDTO: Sendable {

    let timeStamp: Date

    let url: String

    let method: String

    let headers: [String: String]

    let requestBody: Data?

    let responseBody: Data?

    let statusCode: Int?

    let duration: TimeInterval?

    let error: String?
}

