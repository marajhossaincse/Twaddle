//
//  PeopleView.swift
//  Twaddle
//
//  Created by Maraj Hossain on 2/10/24.
//

import SwiftUI

struct PeopleView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Theme.background
                    .ignoresSafeArea(edges: .top)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
