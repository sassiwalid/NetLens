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

        URLProtocol.property(
            forKey: "NetLensProcessed",
            in: request
        ) == nil
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {

        let mutableRequest = NSMutableURLRequest(url: self.request.url!)

        URLProtocol.setProperty(
            true,
            forKey: "NetLensProcessed",
            in: mutableRequest
        )

    }

    override func stopLoading() {}

}

