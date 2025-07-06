//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 06/07/2025.
//

struct InMemoryNetworkCallRepository: NetworkCallRepository {

    private var storedCalls: [NetworkCall] = []

    private let callsSubject: AsyncStream<[NetworkCall]>.Continuation

    private let callsStream: AsyncStream<[NetworkCall]>

    func addNetworkCall(_ call: NetworkCall) async {

    }

    func getAllCalls() async -> [NetworkCall] {
       []
    }

    func clearAllCalls() async {

    }

    func observeCalls() -> AsyncStream<[NetworkCall]> {
        callsStream
    }

}

