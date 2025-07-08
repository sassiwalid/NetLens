//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 08/07/2025.
//

import Foundation

actor URLProtocolNetworkInterceptor: @preconcurrency NetworkInterceptor {

    private var _isEnabled: Bool = false

    @MainActor
    func enable() async {
        guard await !_isEnabled else { return }

        URLProtocol.registerClass(NetLensURLProtocol.self)

        NetLensURLProtocol.interceptor = self

        await self.setEnabled(true)
    }

    func setEnabled(_ enabled: Bool) {
        _isEnabled = enabled
    }

    @MainActor
    func disable() async {

        guard await self._isEnabled else { return }

        URLProtocol.unregisterClass(NetLensURLProtocol.self)

        NetLensURLProtocol.interceptor = nil

        await self.setEnabled(false)
    }
    
    var isEnabled: Bool {
        _isEnabled
    }

    var onNetworkCallIntercepted: ((NetworkCall) async -> Void)?
    

}

