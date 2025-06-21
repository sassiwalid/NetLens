//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 21/06/2025.
//

protocol NetworkInterceptor: Sendable {

    func enable()
    
    func disable()
    
    var isEnabled: Bool { get }
    
    var onNetworkCallIntercepted: ((NetworkCall) async -> Void)? { get set }
}

