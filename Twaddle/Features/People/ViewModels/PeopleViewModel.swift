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
    @Published private(set) var viewState: ViewState?
    @Published var hasError = false

    private var page = 1
    private var totalPages: Int?

    var isLoading: Bool {
        viewState == .loading
    }

    var isFetching: Bool {
        viewState == .fetching
    }

    @MainActor
    func fetchUsers() async {
        viewState = .loading

        // resets value of isLoading to false when function completes execution
        defer { viewState = .finished }

        do {
            let response = try await NetworkingManager.shared.request(
                .people(page: page),
                type: UsersReponse.self)

            totalPages = response.totalPages

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
        guard page != totalPages else { return }

        viewState = .fetching
        defer { viewState = .finished }

        page += 1

        do {
            let response = try await NetworkingManager.shared.request(
                .people(page: page),
                type: UsersReponse.self)

            totalPages = response.totalPages

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

extension PeopleViewModel {
    enum ViewState {
        case fetching
        case loading
        case finished
    }
}
