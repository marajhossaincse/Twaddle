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
            Text("Hello, world!")
            Text("Getting started with take home project.")
            Text("Getting started with take home project second commit.")
            Text("Getting started with take home project third commit.")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
