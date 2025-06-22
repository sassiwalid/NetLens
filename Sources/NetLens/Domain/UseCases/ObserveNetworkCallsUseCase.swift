//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 21/06/2025.
//

protocol ObserveNetworkCallsUseCase: Sendable {

    func execute() -> AsyncStream<[NetworkCall]>
}

final class ObserveNetworkCallsUseCaseImpl: ObserveNetworkCallsUseCase, @unchecked Sendable {

    private var networkCallRepository: NetworkCallRepository

    init(networkCallRepository: NetworkCallRepository) {

        self.networkCallRepository = networkCallRepository
    }
    
    func execute() -> AsyncStream<[NetworkCall]> {
        networkCallRepository.observeCalls()
    }
}

