//
//  CheckmarkPopoverView.swift
//  Twaddle
//
//  Created by Maraj Hossain on 3/14/24.
//

import SwiftUI

struct CheckmarkPopoverView: View {
    var body: some View {
        Symbols.checkmark
            .font(
                .system(
                    .largeTitle,
                    design: .rounded
                ).bold()
            )
    }
}

struct CheckmarkPopoverView_Previews: PreviewProvider {
    static var previews: some View {
        CheckmarkPopoverView()
    }
}
