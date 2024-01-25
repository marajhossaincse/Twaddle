//
//  User.swift
//  Twaddle
//
//  Created by Maraj Hossain on 7/11/23.
//

import SwiftUI

struct User: Codable, Identifiable {
    let id: Int?
    let name, email: String?
    let gender: String?
    let status: String?

    static var example = User(
        id: 001,
        name: "Lorem Ipsum",
        email: "lorem@ipsum.com",
        gender: "Male",
        status: "active")

    func getId() -> Int {
        return self.id ?? 0
    }

    func getName() -> String {
        return self.name ?? ""
    }

    func getEmail() -> String {
        return self.email ?? ""
    }

    func getGender() -> String {
        return self.gender ?? ""
    }

    func getStatus() -> String {
        return self.status ?? ""
    }

    func getStatusColor() -> Color {
        if self.status?.lowercased() == "active" {
            return Color.green
        } else {
            return Color.gray
        }
    }
}

// enum Gender: String, Codable, StringProtocol {
//    case female = "female"
//    case male = "male"
// }
//
// enum Status: String, Codable {
//    case active = "active"
//    case inactive = "inactive"
// }
