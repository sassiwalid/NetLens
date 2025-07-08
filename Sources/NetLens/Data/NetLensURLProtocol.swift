//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 08/07/2025.
//

import Foundation

class NetLensURLProtocol: URLProtocol {
    @MainActor
    static weak var interceptor: URLProtocolNetworkInterceptor?

    override class func canInit(with request: URLRequest) -> Bool {

        true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {}

    override func stopLoading() {}

}

