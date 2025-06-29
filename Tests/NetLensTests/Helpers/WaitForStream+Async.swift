//
//  NetworkCall.swift
//  NetLens
//
//  Created by NetLens on 25/06/2025.
//

import Foundation

enum AsyncTestError: Error {
    case timedOut
}

extension AsyncStream {
    func waitForStreamValue<T:Sendable> (from stream: AsyncStream<T>, timeout: TimeInterval = 1.0) async throws -> T {
        try await withThrowingTaskGroup(of: T?.self) { group in

            group.addTask {
                var iterator = stream.makeAsyncIterator()
                
                return await iterator.next()
            }
            
            guard let result = try await group.next() else {
                throw AsyncTestError.timedOut
            }
            
            group.cancelAll()
            
            guard let result else { throw AsyncTestError.timedOut }
            
            return result

        }
    }
}

