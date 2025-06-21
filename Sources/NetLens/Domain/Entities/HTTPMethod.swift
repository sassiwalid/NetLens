//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 21/06/2025.
//


import Foundation

@frozen
public enum HTTPMethod: String, Sendable {
    case GET, POST, PUT, DELETE, PATCH, HEAD, OPTIONS

}
