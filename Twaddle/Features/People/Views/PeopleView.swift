//
//  PeopleView.swift
//  Twaddle
//
//  Created by Maraj Hossain on 2/10/24.
//

import SwiftUI

struct PeopleView: View {
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)

    @StateObject private var vm = PeopleViewModel()

//    @State private var users: [User] = []
    @State private var shouldShowCreate = false

    var body: some View {
        NavigationView {
            ZStack {
                background

                if vm.isLoading {
                    ProgressView()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(vm.users, id: \.id) { user in
                                NavigationLink(destination: {
                                    DetailView(userId: user.id)
                                }, label: {
                                    PersonItemView(user: user)
                                })
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("People")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    create
                }
            }
            .onAppear {
                vm.fetchUsers()
                ////  API call format when using mock json
//                do {
//                    let res = try StaticJSONMapper.decode(file: "UsersStaticData", type: UsersReponse.self)
//                    users = res.data
//                } catch {}
            }
            .sheet(isPresented: $shouldShowCreate) {
                CreateView()
            }
            .alert(
                isPresented: $vm.hasError,
                error: vm.error
            ) {
                Button("Retry") {
                    vm.fetchUsers()
                }
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
