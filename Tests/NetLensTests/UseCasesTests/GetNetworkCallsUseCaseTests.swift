//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 29/06/2025.
//

import Testing

@testable import NetLens

@Suite("Get NetworkCalls UseCase")
struct GetNetworkCallsUseCaseTests {
    
    private let mockNetworkrepository: MockNetworkCallRepository
    
    private let getNetworkCallsUseCase: GetNetworkCallsUseCaseImpl
    
    init() {
        
        mockNetworkrepository = MockNetworkCallRepository()
        
        getNetworkCallsUseCase = GetNetworkCallsUseCaseImpl(networkCallRepository: mockNetworkrepository)
    }
    
    @Test("execute with no calls should return empty array")
    func executeWithNoCallsShouldReturnEmptyArray() async throws {
        
        
        let networkCalls = await getNetworkCallsUseCase.execute()
        
        #expect(networkCalls.isEmpty)
        
        #expect(await mockNetworkrepository.getAllCallCallCount == 1)
    }
    
    @Test("Execute with stored calls should return those calls")
    func executeWithStoredCallsShouldReturnThoseCalls() async throws {
        
        let calls = NetworkCallFactory.makeMultipleCalls(count: 3)
        
        await mockNetworkrepository.preloadCalls(calls)
        
        let networkCalls = await getNetworkCallsUseCase.execute()
        
        #expect(networkCalls.count == 3)
        
        #expect(await mockNetworkrepository.getAllCallCallCount == 1)
        
        
    }
}


