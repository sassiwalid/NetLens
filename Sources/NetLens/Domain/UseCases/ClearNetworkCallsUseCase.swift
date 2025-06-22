//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 21/06/2025.
//

public protocol ClearNetworkCallsUseCase: Sendable {

    func execute() async
}

final class ClearNetworkCallsUseCaseImpl: ClearNetworkCallsUseCase, @unchecked Sendable {
    
    private var networkCallRepository: NetworkCallRepository
    
    init(networkCallRepository: NetworkCallRepository) {

        self.networkCallRepository = networkCallRepository
    }

    func execute() async {
        networkCallRepository.clearAllCalls()
    }

}

