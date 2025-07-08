//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 21/06/2025.
//

protocol NetworkInterceptor: Sendable {

    func enable() async

    func disable() async

    var isEnabled: Bool { get async }

    var onNetworkCallIntercepted: ((NetworkCall) async -> Void)? { get set }
}

