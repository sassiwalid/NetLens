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
    
    private let useCase: StartNetworkInterceptionUseCase
    
    init() {
        
        self.mockInterceptor = .init()

        self.mockRepository = .init()
        
        useCase = StartNetworkInterceptionUseCaseImpl(
            interceptor: mockInterceptor,
            repository: mockRepository
        )
    }
    
    @Test("Execute should enable interceptor")
    func executeEnablesInterceptor() async throws {
        #expect(!mockInterceptor.isEnabled)
        
        await useCase.execute()
        
        #expect(mockInterceptor.isEnabled)
        #expect(mockInterceptor.enableCallCount == 1)
    }
}

        
        
