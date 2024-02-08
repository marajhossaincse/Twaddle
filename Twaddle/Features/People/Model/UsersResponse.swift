//
//  UsersResponse.swift
//  Twaddle
//
//  Created by Maraj Hossain on 2/8/24.
//

import Foundation

// MARK: - UsersReponse

struct UsersReponse: Codable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support
}
