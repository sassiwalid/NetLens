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

func waitForStreamCondition<T: Sendable>(
    from stream: AsyncStream<T>,
    timeout: TimeInterval = 2.0,
    condition: @Sendable @escaping (T) -> Bool
) async throws -> T {
    try await withThrowingTaskGroup(of: T?.self) { group in

        group.addTask(operation: { @Sendable in
                var iterator = stream.makeAsyncIterator()

                while let value = await iterator.next() {
                    if condition(value) {
                        return value
                    }
                }
                return nil
            })

        group.addTask {
            try await Task.sleep(for: .seconds(timeout))
            return nil
        }

        guard let result = try await group.next() else {
            throw AsyncTestError.timedOut
        }

        group.cancelAll()

        guard let value = result else {
            throw AsyncTestError.timedOut
        }

        return value
    }
}


