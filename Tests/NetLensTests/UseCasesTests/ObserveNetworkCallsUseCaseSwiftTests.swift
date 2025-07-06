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
    func executeReturnstream() async throws {

        let testCall = NetworkCallFactory.makeSuccessCall()

        let stream = observeNetworkCallsUseCase.execute()

        let streamTask = Task {
            try await waitForStreamCondition(
                from: stream,
                timeout: 2.0
            ) { calls in
                !calls.isEmpty
            }
        }

        try await Task.sleep(for: .milliseconds(50))

        await mockNetworkrepository.addNetworkCall(testCall)

        let receivedCalls = try await streamTask.value

        #expect(receivedCalls.count == 1)

        #expect(receivedCalls.first?.id == testCall.id)

    }


}

