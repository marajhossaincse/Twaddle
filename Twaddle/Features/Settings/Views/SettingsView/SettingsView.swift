//
//  SettingsView.swift
//  Twaddle
//
//  Created by Maraj Hossain on 20/3/24.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage(UserDefaultKeys.hapticsEnabled) private var isHapticsEnabled: Bool = true

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
        Toggle("Enable haptics", isOn: $isHapticsEnabled)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
