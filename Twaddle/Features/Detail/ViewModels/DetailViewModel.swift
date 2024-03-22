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

    func fetchDetails(for id: Int) {
        isLoading = true
        NetworkingManager.shared.request(
            .detail(id: id),
            type: UserDetailResponse.self
        ) { [weak self] res in

            DispatchQueue.main.async {
                defer{self?.isLoading = false}
                switch res {
                case .success(let resultData):
                    self?.userInfo = resultData
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
