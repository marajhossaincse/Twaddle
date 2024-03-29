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

    private var page = 1

    @MainActor
    func fetchUsers() async {
        isLoading = true

        // resets value of isLoading to false when function completes execution
        defer { isLoading = false }

        do {
            let response = try await NetworkingManager.shared.request(
                .people(page: page),
                type: UsersReponse.self)
            users = response.data
        } catch {
            hasError = true
            if let networkingError = error as? NetworkingManager.NetworkingError {
                self.error = networkingError
            } else {
                self.error = .custom(error: error)
            }
        }
    }

    @MainActor
    func nextSetOfUsers() async {
        page += 1

        do {
            let response = try await NetworkingManager.shared.request(
                .people(page: page),
                type: UsersReponse.self)
            users += response.data
        } catch {
            hasError = true
            if let networkingError = error as? NetworkingManager.NetworkingError {
                self.error = networkingError
            } else {
                self.error = .custom(error: error)
            }
        }
    }

    func hasReachedEnd(of user: User) -> Bool {
        users.last?.id == user.id
    }
}


