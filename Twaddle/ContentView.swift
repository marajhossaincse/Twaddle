//
//  ContentView.swift
//  Twaddle
//
//  Created by Maraj Hossain on 7/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
        }
        .padding()
        .onAppear {
            print("👇🏽 Users response")
            dump(
                try? StaticJSONMapper.decode(
                    file: "UsersStaticData",
                    type: UsersReponse.self
                )
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
