//
//  CreateView.swift
//  Twaddle
//
//  Created by Maraj Hossain on 2/19/24.
//

import SwiftUI

struct CreateView: View {
    var body: some View {
        Form {
            firstname

            lastname

            job

            Section {
                submit
            }
        }
    }
}

private extension CreateView {
    var firstname: some View {
        TextField("First Name", text: .constant(""))
    }

    var lastname: some View {
        TextField("Last Name", text: .constant(""))
    }

    var job: some View {
        TextField("Job", text: .constant(""))
    }

    var submit: some View {
        Button("Submit") {
            // TODO: Handle action
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
