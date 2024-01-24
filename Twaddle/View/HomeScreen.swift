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
                            VStack(spacing: 0) {
                                HStack(spacing: 0) {
                                    ZStack {
                                        Circle()
                                            .stroke(user.getStatusColor(), lineWidth: 3)
                                            .frame(height: 70)

                                        Image(systemName: "person.crop.circle")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.white)
                                    }
                                    .padding()

                                    Text(user.getName())
                                }
                            }
                            .frame(maxWidth: .infinity)
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
