//
//  UserDetailResponse.swift
//  Twaddle
//
//  Created by Maraj Hossain on 2/8/24.
//

import Foundation

// MARK: - UserDetailResponse

struct UserDetailResponse: Codable {
    let data: User
    let support: Support
}

// MARK: - User

struct User: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String
}

// MARK: - Support

struct Support: Codable {
    let url: String
    let text: String
}
