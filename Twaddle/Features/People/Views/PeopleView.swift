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
                            Text("\(item) Hello World!")

                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(.blue)
                                    .frame(height: 130)

                                VStack {
                                    Text("# \(item)")
                                        .font(
                                            .system(.caption, design: .rounded)
                                                .bold()
                                        )
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 9)
                                        .padding(.vertical, 4)
                                        .background(Theme.pill, in: Capsule())
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("People")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {} label: {
                        Symbols.plus
                            .font(
                                .system(.headline, design: .rounded)
                                    .bold()
                            )
                    }
                }
            }
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
