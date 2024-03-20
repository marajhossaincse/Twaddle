//
//  SettingsView.swift
//  Twaddle
//
//  Created by Maraj Hossain on 20/3/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                haptics
            }
            .navigationTitle("Settings")
        }
    }
}

extension SettingsView {
    var haptics: some View {
        Toggle("Enable haptics", isOn: .constant(true))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
