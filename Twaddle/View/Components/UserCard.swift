//
//  UserCard.swift
//  Twaddle
//
//  Created by Maraj Hossain on 7/12/23.
//

import SwiftUI

struct UserCard: View {
    let name: String
    let email: String
    let gender: String
    let status: String
    let statusColor: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .aspectRatio(1, contentMode: .fit)
                    

                Text(name)
                    .font(.title2)
                    .padding(.horizontal, 10)
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 10)

            Text(email)
                .font(.callout)
                .padding(.vertical, 2.5)
                .padding(.horizontal, 10)
                .foregroundColor(.accentColor)
                .lineLimit(1)

            HStack(spacing: 0) {
                Text(gender)
                    .font(.caption)

                Spacer()

                Text(status)
                    .font(.caption)
                    .foregroundColor(statusColor)
            }
            .padding(.vertical, 2.5)
            .padding(.horizontal, 10)
        }
        .background(Color.gray.opacity(0.4))
        .foregroundColor(.black)
        .cornerRadius(8)
    }
}

struct UserCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            UserCard(
                name: "Maraj",
                email: "maraj@mail.com",
                gender: "Male",
                status: "Active",
                statusColor: .green
            )
        }
    }
}
