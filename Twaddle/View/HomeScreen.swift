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
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(viewmodel.users) { user in
                        NavigationLink(destination: {
                            UserDetailScreen()

                        }, label: {
                            UserCard(
                                name: user.getName(),
                                email: user.getEmail(),
                                gender: user.getGender(),
                                status: user.getStatus(),
                                statusColor: user.getStatusColor()
                            )
                            .padding(.vertical, 7)
                            .padding(.horizontal, 7)
                        })
                    }
                }
            }
            .toolbar {
                Button {} label: {
                    Text("Functionality")
                }
                
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewmodel.fetch()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
