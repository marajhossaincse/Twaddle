//
//  PeopleView.swift
//  Twaddle
//
//  Created by Maraj Hossain on 2/10/24.
//

import SwiftUI

struct PeopleView: View {
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)

    @State private var users: [User] = []
    @State private var shouldShowCreate = false

    var body: some View {
        NavigationView {
            ZStack {
                background
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(users, id: \.id) { user in
                            NavigationLink(destination: {
                                DetailView()
                            }, label: {
                                PersonItemView(user: user)
                            })
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("People")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    create
                }
            }
            .onAppear {
                NetworkingManager.shared.request(
                    "https://reqres.in/api/users/1",
                    type: UsersReponse.self
                ) { res in
                    switch res {
                    case .success(let resultData):
                        users = resultData.data
                    case .failure(let error):
                        print(error)
                    }
                }

                ////  API call format when using mock json
//                do {
//                    let res = try StaticJSONMapper.decode(file: "UsersStaticData", type: UsersReponse.self)
//                    users = res.data
//                } catch {}
            }
            .sheet(isPresented: $shouldShowCreate) {
                CreateView()
            }
        }
    }
}

private extension PeopleView {
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .top)
    }

    var create: some View {
        Button {
            shouldShowCreate.toggle()
        } label: {
            Symbols.plus
                .font(
                    .system(.headline, design: .rounded)
                        .bold()
                )
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
