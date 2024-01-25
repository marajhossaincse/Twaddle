//
//  UserDetailScreen.swift
//  Twaddle
//
//  Created by Maraj Hossain on 7/14/23.
//

import SwiftUI

struct UserDetailScreen: View {
    var user: User

    var body: some View {
        Form {
            Section {
                Text("Name: \(user.getName())")

                Text("Email: \(user.getEmail())")

                Text("Sex: \(user.getGender())")

            } header: {
                Text("Baic Info:")
            }
        }
    }
}

struct UserDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailScreen(user: User.example)
    }
}
