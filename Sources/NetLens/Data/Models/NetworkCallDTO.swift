//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 09/07/2025.
//

import Foundation

struct NetworkCallDTO: Sendable {

    let id: UUID

    let request: NetworkRequestDTO

    let response: NetworkResponseDTO?

    let error: String?

    let timestamp: Date

    let duration: TimeInterval

}

