//
//  HomeScreen.swift
//  Twaddle
//
//  Created by Maraj Hossain on 7/12/23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewmodel = UserViewModel()

    var body: some View {
        List(viewmodel.users) { user in
            NavigationLink(destination: {
                UserDetailScreen(user: user)
            }, label: {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        ZStack(alignment: .leading) {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: 45, height: 45)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)

                            Circle()
                                .stroke(user.getStatusColor(), lineWidth: 3)
                                .frame(width: 45, height: 45)
                        }

                        VStack(alignment: .leading) {
                            Text(user.getName())

                            Text(user.getStatus())
                        }
                        .padding(.leading)
                    }
                    Spacer()
                }
            })
        }
        .toolbar {
            Button {} label: {
                Text("Functionality")
            }
        }
        .navigationTitle("Home")
        .onAppear {
            viewmodel.fetchUser()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
