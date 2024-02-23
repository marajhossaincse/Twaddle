//
//  PeopleViewModel.swift
//  Twaddle
//
//  Created by Maraj Hossain on 2/23/24.
//

import Foundation

final class PeopleViewModel: ObservableObject{

    @Published private(set) var users: [User] = []
    
    func fetchUsers(){
        NetworkingManager.shared.request(
            "https://reqres.in/api/users/1",
            type: UsersReponse.self
        ) { [weak self] res in
            switch res {
            case .success(let resultData):
                self?.users = resultData.data
            case .failure(let error):
                print(error)
            }
        }
    }
}
