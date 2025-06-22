//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 22/06/2025.
//

import Foundation

@testable import NetLens

@MainActor
final class MockNetworkCallRepository: @preconcurrency NetworkCallRepository, @unchecked Sendable {
    
    private(set) var calls: [NetworkCall] = []
    
    private(set) var addNetworkCallCallCount: Int = 0
    
    private(set) var getAllCallCallCount: Int = 0
    
    private(set) var clearAllCallsCount = 0
    
    private var callsSubject = AsyncStream<[NetworkCall]>.makeStream()

    func addNetworkCall(_ call: NetworkCall) async {
        calls.append(call)
        
        addNetworkCallCallCount += 1
        
        callsSubject.continuation.yield(calls)
    }
    
    func getAllCalls() async -> [NetworkCall] {
        getAllCallCallCount += 1
        
        return calls
    }
    
    func clearAllCalls() async {
        clearAllCallsCount += 1

        calls.removeAll()

        callsSubject.continuation.yield(calls)
    }
    
    func observeCalls() -> AsyncStream<[NetworkCall]> {
        callsSubject.stream
    }
    
    func reset() {
        calls.removeAll()

        addNetworkCallCallCount = 0

        getAllCallCallCount = 0

        clearAllCallsCount = 0
        
        callsSubject = AsyncStream<[NetworkCall]>.makeStream()
    }
    
}

