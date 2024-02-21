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

    func request<T: Codable>(_ absoluteURL: String, type: T.Type) {
        let url = URL(string: absoluteURL)

        let request = URLRequest(url: url!)

        let dataTasks = URLSession.shared.dataTask(with: request) { data, response, error in

            if error != nil {
                return
            }

            guard let response = response as? HTTPURLResponse,
                  (200 ... 300) ~= response.statusCode
            else {
                return
            }

            guard let data = data else {
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(T.self, from: data)
            } catch {
                print(error)
            }
        }
        dataTasks.resume()
    }
}
