//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 09/07/2025.
//

import Foundation

struct NetworkResponseDTO: Sendable {

    let statusCode: Int

    let headers: [String: String]

    let body: Data?

}

