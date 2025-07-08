//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 08/07/2025.
//

import Foundation

actor URLProtocolNetworkInterceptor: @preconcurrency NetworkInterceptor {

    private var _isEnabled: Bool = false

    func enable() async {
       guard !_isEnabled else { return }

        _isEnabled = true
    }
    
    func disable() async {
        guard _isEnabled else { return }

         _isEnabled = false
    }
    
    var isEnabled: Bool {
        _isEnabled
    }

    var onNetworkCallIntercepted: ((NetworkCall) async -> Void)?
    

}

