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
        if status?.lowercased() == "active"{
            return Color.green
        } else {
            return Color.red
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
