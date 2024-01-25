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
        
//        VStack(spacing: 0) {
//            Image(systemName: "exclamationmark.octagon")
//                .resizable()
//                .renderingMode(.original)
//                .aspectRatio(1, contentMode: .fit)
//                .frame(width: 50, height: 50)
//                .padding()
//
//            Text("Under Construction")
//                .font(.title)
//        }
    }
}

struct UserDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailScreen(user: User.example)
    }
}
