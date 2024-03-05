//
//  TwaddleApp.swift
//  Twaddle
//
//  Created by Maraj Hossain on 7/11/23.
//

/*
 Future Works:
    - redesign home page
    - perfect toolbar buttons
    - add CRUD functions for users
    - ...
 */

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
            }
        }
    }
}
