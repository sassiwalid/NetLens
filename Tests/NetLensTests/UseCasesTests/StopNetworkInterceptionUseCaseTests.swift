//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 26/06/2025.
//

import Testing
@testable import NetLens

@Suite("Start Network interception use case")
struct StopNetworkInterceptionUseCaseTests {

    private let mockInterceptor: MockNetworkInterceptor
    
    private let stopNetworkInterceptionUseCase: StopNetworkInterceptionUseCase
    
    init() {
        
        self.mockInterceptor = .init()
        
        stopNetworkInterceptionUseCase = StopNetworkInterceptionUseCaseImpl(interceptor: mockInterceptor)
    }
    
    @Test("Execute disable interception")
    func executeDisableInterception() async {

        mockInterceptor.enable()
        
        #expect(mockInterceptor.isEnabled == true)
        
        await stopNetworkInterceptionUseCase.execute()

        #expect(mockInterceptor.isEnabled == false)
        
        #expect(mockInterceptor.disableCallCount == 1)

    }
    
    @Test("Clear CallBack")
    func executeClearCallBack() async {

        mockInterceptor.enable()
        
        mockInterceptor.onNetworkCallIntercepted = { _ in }
        
        #expect(mockInterceptor.onNetworkCallIntercepted != nil )
        
        await stopNetworkInterceptionUseCase.execute()
        
        #expect(mockInterceptor.onNetworkCallIntercepted == nil)

    }
}

