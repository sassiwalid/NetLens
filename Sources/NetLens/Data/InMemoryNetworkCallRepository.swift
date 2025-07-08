//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 06/07/2025.
//

actor InMemoryNetworkCallRepository: NetworkCallRepository {

    // MARK: - private properties

    private var storedCalls: [NetworkCall] = []

    private let callsSubject: AsyncStream<[NetworkCall]>.Continuation

    private let callsStream: AsyncStream<[NetworkCall]>

    // MARK: - Life Cycle

    init() {

        let (stream, continuation) = AsyncStream<[NetworkCall]>.makeStream()

        self.callsStream = stream

        self.callsSubject = continuation

        continuation.yield([])
    }

    deinit {

        callsSubject.finish()
    }

    // MARK: - NetworkCallRepository methods

    func addNetworkCall(_ call: NetworkCall) async {

        storedCalls.append(call)

        callsSubject.yield(storedCalls)

    }

    func getAllCalls() async -> [NetworkCall] {

        storedCalls
    }

    func clearAllCalls() async {

        storedCalls.removeAll()

        callsSubject.yield(storedCalls)

    }

    nonisolated func observeCalls() -> AsyncStream<[NetworkCall]> {
        callsStream
    }

}

