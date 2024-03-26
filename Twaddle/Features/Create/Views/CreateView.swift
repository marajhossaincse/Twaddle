//
//  CreateView.swift
//  Twaddle
//
//  Created by Maraj Hossain on 2/19/24.
//

import SwiftUI

struct CreateView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var vm = CreateViewModel()
    let successfulAction: () -> Void

    var body: some View {
        NavigationView {
            Form {
                firstname

                lastname

                job

                Section {
                    submit
                }
            }
            .disabled(vm.state == .submitting)
            .navigationTitle("Create")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    done
                }
            }
            .onChange(of: vm.state) { formState in
                if formState == .successful {
                    dismiss()
                    successfulAction()
                }
            }
            .alert(
                isPresented: $vm.hasError,
                error: vm.error) {}
            .overlay {
                if vm.state == .submitting {
                    ProgressView()
                }
            }
        }
    }
}

private extension CreateView {
    var firstname: some View {
        TextField("First Name", text: $vm.person.firstName)
    }

    var lastname: some View {
        TextField("Last Name", text: $vm.person.lastName)
    }

    var job: some View {
        TextField("Job", text: $vm.person.job)
    }

    var submit: some View {
        Button("Submit") {
            Task {
                await vm.create()
            }
        }
    }

    var done: some View {
        Button("Done") {
            dismiss()
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView {}
    }
}
