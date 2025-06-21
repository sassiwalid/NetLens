//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 21/06/2025.
//

import Foundation

@frozen
public struct NetworkError: Error, Sendable {
    public let code: Int

    public let message: String

    public let underlyingError: String?
    
    public init(
        code: Int,
        message: String,
        underlyingError: Error? = nil
    ) {
        self.code = code

        self.message = message

        self.underlyingError = underlyingError?.localizedDescription
    }
}
