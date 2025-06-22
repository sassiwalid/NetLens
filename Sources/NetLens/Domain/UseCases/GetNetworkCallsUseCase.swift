//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 21/06/2025.
//

protocol GetNetworkCallsUseCase: Sendable {

    func execute() -> [NetworkCall]

}

final class GetNetworkCallsUseCaseImpl: GetNetworkCallsUseCase, @unchecked Sendable {

    private var networkCallRepository: NetworkCallRepository

    init(networkCallRepository: NetworkCallRepository) {

        self.networkCallRepository = networkCallRepository
    }

    func execute() -> [NetworkCall] {
        networkCallRepository.getAllCalls()
    }

}

