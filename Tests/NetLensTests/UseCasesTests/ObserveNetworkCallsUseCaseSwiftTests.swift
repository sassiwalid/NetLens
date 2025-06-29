//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 29/06/2025.
//

import Testing

@testable import NetLens

@Suite("Observe Network Calls use case")
struct ObserveNetworkCallsUseCaseSwiftTests {
    private let mockNetworkrepository: MockNetworkCallRepository
    
    private let getNetworkCallsUseCase: GetNetworkCallsUseCaseImpl
    
    init() {
        
        mockNetworkrepository = MockNetworkCallRepository()
        
        getNetworkCallsUseCase = GetNetworkCallsUseCaseImpl(networkCallRepository: mockNetworkrepository)
    }
    
    
}

