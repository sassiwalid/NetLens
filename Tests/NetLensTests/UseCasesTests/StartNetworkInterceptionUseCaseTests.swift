//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 22/06/2025.
//

import Testing

@testable import NetLens

@Suite("Start Network interception use case")
struct StartNetworkInterceptionUseCaseTests {
    private let mockInterceptor: MockNetworkInterceptor
    
    private let mockRepository: MockNetworkCallRepository
    
    private let startNetworkInterceptionUseCase: StartNetworkInterceptionUseCase
    
    init() {
        
        self.mockInterceptor = .init()

        self.mockRepository = .init()
        
        startNetworkInterceptionUseCase = StartNetworkInterceptionUseCaseImpl(
            interceptor: mockInterceptor,
            repository: mockRepository
        )
    }
    
    @Test("Execute should enable interceptor")
    func executeEnablesInterceptor() async throws {
        #expect(!mockInterceptor.isEnabled)
        
        await startNetworkInterceptionUseCase.execute()
        
        #expect(mockInterceptor.isEnabled)

        #expect(mockInterceptor.enableCallCount == 1)
    }
    
    @Test("Execute should configure callBack to repository")
    func executeConfiguresCallBackToRepository() async throws {
        // Given
        let testCall = NetworkCallFactory.makeSuccessCall()
        
        // When
        await startNetworkInterceptionUseCase.execute()
        
        await mockInterceptor.simulateNetworkCallInterception(testCall)
        
        // Then
        
        let storedCalls = await mockRepository.getAllCalls()
        
        #expect(storedCalls.count == 1)
        
        #expect(storedCalls[0].id == testCall.id)

    }
}

        
        
