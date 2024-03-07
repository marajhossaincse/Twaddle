//
//  PeopleViewModel.swift
//  Twaddle
//
//  Created by Maraj Hossain on 2/23/24.
//

import Foundation

final class PeopleViewModel: ObservableObject {
    @Published private(set) var users: [User] = []
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published private(set) var isLoading: Bool = false
    @Published var hasError = false

    func fetchUsers() {
        isLoading = true
        NetworkingManager.shared.request(
            "https://reqres.in/api/users?delay=3",
            type: UsersReponse.self
        ) { [weak self] res in

            DispatchQueue.main.async {
                switch res {
                case .success(let resultData):
                    self?.users = resultData.data
                case .failure(let error):
                    self?.hasError = true
                    self?.error = error as? NetworkingManager.NetworkingError
                }
            }
        }
    }
}
