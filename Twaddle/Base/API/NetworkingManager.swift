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

    func request<T: Codable>(
        methodType: MethodType = .GET,
        _ absoluteURL: String,
        type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void)
    {
        guard let url = URL(string: absoluteURL) else {
            completion(.failure(NetworkingError.invalidUrl))
            return
        }

        let request = buildRequest(from: url, methodType: methodType)

        let dataTasks = URLSession.shared.dataTask(with: request) { data, response, error in

            if error != nil {
                completion(.failure(NetworkingError.custom(error: error!)))

                return
            }

            guard let response = response as? HTTPURLResponse,
                  (200 ... 300) ~= response.statusCode
            else {
                let statusCode = (response as! HTTPURLResponse).statusCode
                completion(.failure(NetworkingError.invalidStatusCode(statusCode: statusCode)))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkingError.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(T.self, from: data)

                completion(.success(result))
            } catch {
                completion(.failure(NetworkingError.failedToDecode(error: error)))
            }
        }
        dataTasks.resume()
    }

    func request(
        methodType: MethodType = .POST,
        _ absoluteURL: String,
        completion: @escaping (Result<Void, Error>) -> Void)
    {
        guard let url = URL(string: absoluteURL) else {
            completion(.failure(NetworkingError.invalidUrl))
            return
        }

        let request = buildRequest(from: url, methodType: methodType)

        let dataTasks = URLSession.shared.dataTask(with: request) { _, response, error in

            if error != nil {
                completion(.failure(NetworkingError.custom(error: error!)))

                return
            }

            guard let response = response as? HTTPURLResponse,
                  (200 ... 300) ~= response.statusCode
            else {
                let statusCode = (response as! HTTPURLResponse).statusCode
                completion(.failure(NetworkingError.invalidStatusCode(statusCode: statusCode)))
                return
            }

            completion(.success(()))
        }
        dataTasks.resume()
    }
}

extension NetworkingManager {
    enum NetworkingError: Error {
        case invalidUrl
        case custom(error: Error)
        case invalidStatusCode(statusCode: Int)
        case invalidData
        case failedToDecode(error: Error)
    }
}

extension NetworkingManager {
    enum MethodType {
        case GET
        case POST
    }
}

private extension NetworkingManager {
    func buildRequest(
        from url: URL,
        methodType: MethodType) -> URLRequest
    {
        var request = URLRequest(url: url)

        switch methodType {
        case .GET:
            request.httpMethod = "GET"
        case .POST:
            request.httpMethod = "POST"
        }

        return request
    }
}
