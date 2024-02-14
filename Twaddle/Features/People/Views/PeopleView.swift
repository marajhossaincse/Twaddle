//
//  PeopleView.swift
//  Twaddle
//
//  Created by Maraj Hossain on 2/10/24.
//

import SwiftUI

struct PeopleView: View {
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)

    var body: some View {
        NavigationView {
            ZStack {
                Theme.background
                    .ignoresSafeArea(edges: .top)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(0 ... 5, id: \.self) { item in

                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(.blue)
                                    .frame(height: 130)

                                VStack(alignment: .leading) {
                                    Text("#\(item)")
                                        .font(
                                            .system(
                                                .caption,
                                                design: .rounded
                                            )
                                            .bold()
                                        )
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 9)
                                        .padding(.vertical, 4)
                                        .background(Theme.pill, in: Capsule())

                                    Text("First Name - Last Name")
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 5)
                                .background(Theme.detailBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Theme.text.opacity(0.1), radius: 2, x: 0, y: 1)
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
        }
    }
}

private extension PeopleView {
    var create: some View {
        Button {} label: {
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
