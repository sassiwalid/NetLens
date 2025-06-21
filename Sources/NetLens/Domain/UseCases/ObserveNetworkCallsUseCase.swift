//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 21/06/2025.
//

protocol ObserveNetworkCallsUseCase: Sendable {

    func execute() -> AsyncStream<[NetworkCall]>
}

