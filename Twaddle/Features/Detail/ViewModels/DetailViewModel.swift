//
//  DetailViewModel.swift
//  Twaddle
//
//  Created by Maraj Hossain on 2/27/24.
//

import Foundation

final class DetailViewModel: ObservableObject {
    @Published private(set) var userInfo: UserDetailResponse?
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published private(set) var isLoading: Bool = false
    @Published var hasError = false

    @MainActor
    func fetchDetails(for id: Int) async {
        self.isLoading = true

        // resets value of isLoading to false when function completes execution
        defer { isLoading = false }

        do {
            self.userInfo = try await NetworkingManager.shared.request(
                .detail(id: id),
                type: UserDetailResponse.self)
        } catch {
            self.hasError = true
            if let networkingError = error as? NetworkingManager.NetworkingError {
                self.error = networkingError
            } else {
                self.error = .custom(error: error)
            }
        }
    }
}
