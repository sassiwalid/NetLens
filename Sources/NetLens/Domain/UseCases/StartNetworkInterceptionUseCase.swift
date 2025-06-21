//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 21/06/2025.
//

protocol StartNetworkInterceptionUseCase: Sendable {

    func execute() async
}

final class StartNetworkInterceptionUseCaseImpl: StartNetworkInterceptionUseCase, @unchecked Sendable {
    
    private var interceptor: NetworkInterceptor

    private let repository: NetworkCallRepository
    
    init(
        interceptor: NetworkInterceptor,
        repository: NetworkCallRepository
    ) {
        self.interceptor = interceptor
        
        self.repository = repository
    }
    
    func execute() async {
        interceptor.enable()
        
        interceptor.onNetworkCallIntercepted = { [repository] call in
            await repository.addNetworkCall(call)
            
        }
    }
}
