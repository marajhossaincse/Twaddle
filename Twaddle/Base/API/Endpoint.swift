//
//  Endpoint.swift
//  Twaddle
//
//  Created by Maraj Hossain on 21/3/24.
//

import Foundation

enum Endpoint {
    case people
    case detail(id: Int)
    case create
}

extension Endpoint {
    var host: String { "reqres.in" }
    var path: String {
        switch self {
        case .people:
            return "/api/users"
        case .detail(let id):
            return "/api/users/\(id)"
        case .create:
            return "/api/users"
        }
    }
}

extension Endpoint {
    var url: URL? {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = host
        urlComponent.path = path

        #if DEBUG
            urlComponent.queryItems = [
                URLQueryItem(name: "delay", value: "1")
            ]
        #endif

        return urlComponent.url
    }
}
