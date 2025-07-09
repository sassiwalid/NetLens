//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 09/07/2025.
//

import Foundation

struct NetworkRequestDTO: Sendable {

    let url: String

    let method: String

    let headers: [String: String]

    let body: Data?

}

