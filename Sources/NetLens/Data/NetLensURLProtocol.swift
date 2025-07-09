//
//  NetLensURLProtocol.swift
//  NetLens
//
//  Created by NetLens on 08/07/2025.
//

import Foundation

class NetLensURLProtocol: URLProtocol {

    @MainActor
    static weak var interceptor: URLProtocolNetworkInterceptor?

    private var networkCallDTO: NetworkCallDTO?

    private var dataTask: URLSessionDataTask?

    private var startTime: Date?

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
        let mutableRequest = (self.request as NSURLRequest).mutableCopy() as! NSMutableURLRequest

        URLProtocol.setProperty(
            true,
            forKey: "NetLensProcessed",
            in: mutableRequest
        )

        let startTime = Date()

        self.networkCallDTO = NetworkCallDTO(
            timeStamp: startTime,
            url: request.url?.absoluteString ?? "",
            method: request.httpMethod ?? "GET",
            headers: request.allHTTPHeaderFields ?? [:],
            requestBody: request.httpBody,
            responseBody: nil,
            statusCode: nil,
            duration: nil,
            error: nil
        )

        let session = URLSession(configuration: .default)

        dataTask = session.dataTask(with: mutableRequest as URLRequest) { [weak self] data, response, error in
            guard let self else { return }

            let endTime = Date()

            let duration = self.startTime.map { endTime.timeIntervalSince($0) }

            self.networkCallDTO = NetworkCallDTO(
                timeStamp: self.networkCallDTO?.timeStamp ?? startTime,
                url: self.request.url?.absoluteString ?? "",
                method: self.request.httpMethod ?? "GET",
                headers: self.request.allHTTPHeaderFields ?? [:],
                requestBody: self.request.httpBody,
                responseBody: data,
                statusCode: (response as? HTTPURLResponse)?.statusCode,
                duration: duration,
                error: error?.localizedDescription
            )

            if let networkCallDTO = self.networkCallDTO,
               let networkCall = networkCallDTO.toDomain()
            {
                Task { @MainActor in
                    await Self.interceptor?.onNetworkCallIntercepted?(networkCall)
                }
            }

            if let error = error {
                self.client?.urlProtocol(self, didFailWithError: error)
            } else {
                if let response = response {
                    self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
                }
                if let data = data {
                    self.client?.urlProtocol(self, didLoad: data)
                }
                self.client?.urlProtocolDidFinishLoading(self)
            }
        }

        dataTask?.resume()
    }

    override func stopLoading() {
        dataTask?.cancel()
        dataTask = nil
    }

}
