//
//  NetworkingManager.swift
//  Twaddle
//
//  Created by Maraj Hossain on 2/20/24.
//

import Foundation

final class NetworkingManager {
    static let shared = NetworkingManager()

    private init() {}

    func request<T: Codable>(_ endPoint: Endpoint, type: T.Type) async throws -> T {
        // Check to see if endpoint URL is valid else throw error
        guard let url = endPoint.url else {
            throw NetworkingError.invalidUrl
        }

        // Build the request
        let request = buildRequest(from: url, methodType: endPoint.methodType)

        // Try to execute a fetch request and await for a value/data
        let (data, response) = try await URLSession.shared.data(for: request)

        // See if it receives a valid status code else throw error
        guard let response = response as? HTTPURLResponse,
              (200 ... 300) ~= response.statusCode
        else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw NetworkingError.invalidStatusCode(statusCode: statusCode)
        }

        // Try decoding data using json decoder
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try decoder.decode(T.self, from: data)

        return result
    }

    func request(_ endPoint: Endpoint) async throws {
        // Check to see if endpoint URL is valid else throw error
        guard let url = endPoint.url else {
            throw NetworkingError.invalidUrl
        }

        let request = buildRequest(from: url, methodType: endPoint.methodType)

        // Try to execute a fetch request and await for a value/data
        let (_, response) = try await URLSession.shared.data(for: request)

        // See if it receives a valid status code else throw error
        guard let response = response as? HTTPURLResponse,
              (200 ... 300) ~= response.statusCode
        else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw NetworkingError.invalidStatusCode(statusCode: statusCode)
        }
    }
}

extension NetworkingManager {
    enum NetworkingError: LocalizedError {
        case invalidUrl
        case custom(error: Error)
        case invalidStatusCode(statusCode: Int)
        case invalidData
        case failedToDecode(error: Error)
    }
}

private extension NetworkingManager {
    func buildRequest(
        from url: URL,
        methodType: Endpoint.MethodType) -> URLRequest
    {
        var request = URLRequest(url: url)

        switch methodType {
        case .GET:
            request.httpMethod = "GET"
        case .POST(let data):
            request.httpMethod = "POST"
            request.httpBody = data
        }

        return request
    }
}
