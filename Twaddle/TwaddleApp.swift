//
//  TwaddleApp.swift
//  Twaddle
//
//  Created by Maraj Hossain on 7/11/23.
//

import SwiftUI

@main
struct TwaddleApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PeopleView()
                    .tabItem {
                        Symbols.person
                        Text("Home")
                    }

                SettingsView()
                    .tabItem {
                        Symbols.gear
                        Text("Setting")
                    }
            }
        }
    }
}
