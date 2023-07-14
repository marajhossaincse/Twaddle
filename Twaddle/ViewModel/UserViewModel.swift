//
//  UserViewModel.swift
//  Twaddle
//
//  Created by Maraj Hossain on 7/13/23.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [User] = []

    func fetch() {
        // take  url
        guard let url = URL(string: "https://gorest.co.in/public/v2/users") else {
            return
        }

        // do task on url to get data and check for error
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }

            // convert to JSON
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    self?.users = users
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
