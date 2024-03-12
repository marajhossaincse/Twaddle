//
//  DetailView.swift
//  Twaddle
//
//  Created by Maraj Hossain on 2/16/24.
//

import SwiftUI

struct DetailView: View {
    let userId: Int
    @StateObject private var vm = DetailViewModel()

//    @State private var userInfo: UserDetailResponse?

    var body: some View {
        ZStack {
            background
            if vm.isLoading {
                ProgressView()
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        avatar

                        Group {
                            general

                            link
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 18)
                        .background(
                            Theme.detailBackground,
                            in: RoundedRectangle(cornerRadius: 16, style: .continuous)
                        )
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Details")
        .onAppear {
            vm.fetchDetails(for: userId)
//            do {
//                userInfo = try StaticJSONMapper.decode(
//                    file: "SingleUserData",
//                    type: UserDetailResponse.self
//                )
//            } catch {
//                print(error)
//            }
        }
    }
}

private extension DetailView {
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .top)
    }

    @ViewBuilder
    var avatar: some View {
        if let avatarAbsoluteString = vm.userInfo?.data.avatar,
           let avatarUrl = URL(string: avatarAbsoluteString)
        {
            AsyncImage(url: avatarUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 16,
                    style: .continuous
                ))
        }
    }

    @ViewBuilder
    var link: some View {
        if let supportAbsoluteString = vm.userInfo?.support.url,
           let supportUlr = URL(string: supportAbsoluteString),
           let supportText = vm.userInfo?.support.text
        {
            Link(
                destination: supportUlr)
            {
                VStack(alignment: .leading, spacing: 8) {
                    Text(supportText)
                        .foregroundColor(Theme.text)
                        .font(
                            .system(.body, design: .rounded)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.leading)
                    Text(supportAbsoluteString)
                }

                Spacer()
                Symbols.link
                    .font(.system(.title3, design: .rounded))
            }
        }
    }
}

private extension DetailView {
    var general: some View {
        VStack(alignment: .leading, spacing: 8) {
            PillView(id: vm.userInfo?.data.id ?? 0)

            Group {
                firstname

                lastname

                email
            }
            .foregroundColor(Theme.text)
        }
    }

    @ViewBuilder
    var firstname: some View {
        Text("First Name")
            .font(
                .system(.body, design: .rounded)
                    .weight(.semibold)
            )
        Text(vm.userInfo?.data.firstName ?? "-")
            .font(
                .system(.subheadline, design: .rounded)
            )

        Divider()
    }

    @ViewBuilder
    var lastname: some View {
        Text("Last Name")
            .font(
                .system(.body, design: .rounded)
                    .weight(.semibold)
            )
        Text(vm.userInfo?.data.firstName ?? "-")
            .font(
                .system(.subheadline, design: .rounded)
            )

        Divider()
    }

    @ViewBuilder
    var email: some View {
        Text("Email")
            .font(
                .system(.body, design: .rounded)
                    .weight(.semibold)
            )
        Text("<Email>")
            .font(
                .system(.subheadline, design: .rounded)
            )
    }
}

struct DetailView_Previews: PreviewProvider {
    private static var previewUserId: Int {
        let users = try! StaticJSONMapper.decode(
            file: "UsersStaticData", type: UsersReponse.self
        )

        return users.data.first!.id
    }

    static var previews: some View {
        NavigationView {
            DetailView(userId: previewUserId)
        }
    }
}
