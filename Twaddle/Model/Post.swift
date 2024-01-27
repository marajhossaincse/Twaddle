//
//  Posts.swift
//  Twaddle
//
//  Created by Maraj Hossain on 1/27/24.
//

import Foundation

// MARK: - Post
struct Post: Codable {
    let id, userID: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case title, body
    }
}

