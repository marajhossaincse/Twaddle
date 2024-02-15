//
//  PersonItemView.swift
//  Twaddle
//
//  Created by Maraj Hossain on 2/14/24.
//

import SwiftUI

struct PersonItemView: View {
    let user: User

    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(.blue)
                .frame(height: 130)

            VStack(alignment: .leading) {
                PillView(id: user.id)

                Text("\(user.firstName) \(user.lastName)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
            .padding(.vertical, 5)
            .background(Theme.detailBackground)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: Theme.text.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

struct PersonItemView_Previews: PreviewProvider {
    static var previewUser: User {
        let users = try! StaticJSONMapper.decode(file: "UserStaticData", type: UsersReponse.self)

        return users.data.first!
    }

    static var previews: some View {
        PersonItemView(user: previewUser)
            .frame(width: 250)
    }
}
