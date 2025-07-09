//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 22/06/2025.
//

import Foundation

@testable import NetLens

final class MockNetworkInterceptor: NetworkInterceptor, @unchecked Sendable {

    var onNetworkCallIntercepted: (@Sendable(NetworkCall) async -> Void)?

    private(set) var isEnabled: Bool = false
    
    private(set) var enableCallCount: Int = 0
    
    private(set) var disableCallCount: Int = 0
    
    private var interceptedCallsToEmit: [NetworkCall] = []

    func enable() {
        isEnabled = true
        
        enableCallCount += 1
    }
    
    func disable() {
        
        isEnabled = false
        
        disableCallCount += 1
        
        onNetworkCallIntercepted = nil
        
    }
    
    func simulateNetworkCallInterception(_ call: NetworkCall) async {
        
        guard isEnabled else {
            return
        }
        
        await onNetworkCallIntercepted?(call)

    }

    func setCallsToIntercept(_ calls: [NetworkCall]) {

        interceptedCallsToEmit = calls
    }

    func reset() {

        isEnabled = false

        enableCallCount = 0

        disableCallCount = 0

        interceptedCallsToEmit.removeAll()

        onNetworkCallIntercepted = nil

    }
    
}

