//
//  PillView.swift
//  Twaddle
//
//  Created by Maraj Hossain on 2/14/24.
//

import SwiftUI

struct PillView: View {
    let id: Int

    var body: some View {
        Text("#\(id)")
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
    }
}

struct PillView_Previews: PreviewProvider {
    static var previews: some View {
        PillView(id: 0)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
