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

    private let observeNetworkCallsUseCase: ObserveNetworkCallsUseCaseImpl

    init() {

        mockNetworkrepository = MockNetworkCallRepository()

        observeNetworkCallsUseCase = ObserveNetworkCallsUseCaseImpl(networkCallRepository: mockNetworkrepository)
    }

    @Test("Execute return stream from repository")
    func execureReturnstream() async throws {

        let call = NetworkCallFactory.makeSuccessCall()

        let stream = observeNetworkCallsUseCase.execute()

        let streamTask = Task {
            try await waitForStreamValue(
                from: stream,
                timeout: 2.0
            )
            
        }

        await mockNetworkrepository.addNetworkCall(call)

        let receivedCalls = try await streamTask.value

        #expect(receivedCalls.count == 1)

        #expect(receivedCalls.first?.id == call.id)
        
    }
    
    
}

