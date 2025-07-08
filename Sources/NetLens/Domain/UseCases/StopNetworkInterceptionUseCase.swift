//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 21/06/2025.
//

protocol StopNetworkInterceptionUseCase: Sendable {

    func execute() async
}

final class StopNetworkInterceptionUseCaseImpl: StopNetworkInterceptionUseCase, @unchecked Sendable {
    
    private var interceptor: NetworkInterceptor
    
    init(interceptor: NetworkInterceptor) {
        
        self.interceptor = interceptor
    }

    func execute() async {

        await interceptor.disable()

        interceptor.onNetworkCallIntercepted = nil
        
    }
}

