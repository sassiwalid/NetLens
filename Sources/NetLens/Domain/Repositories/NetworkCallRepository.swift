//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 21/06/2025.
//

import Foundation

protocol NetworkCallRepository: Sendable {
    
    func addNetworkCall(_ call: NetworkCall) async

    func getAllCalls() -> [NetworkCall]

    func clearAllCalls()
    
    func observeCalls() -> AsyncStream<[NetworkCall]>
}

