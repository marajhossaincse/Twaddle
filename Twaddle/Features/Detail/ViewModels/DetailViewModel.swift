//
//  DetailViewModel.swift
//  Twaddle
//
//  Created by Maraj Hossain on 2/27/24.
//

import Foundation

final class DetailViewModel: ObservableObject {
    @Published private(set) var userInfo: UserDetailResponse?

    func fetchDetails(for id: Int) {
        NetworkingManager.shared.request(
            "https://reqres.in/api/users/\(id)",
            type: UserDetailResponse.self
        ) { [weak self] res in

            DispatchQueue.main.async {
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
