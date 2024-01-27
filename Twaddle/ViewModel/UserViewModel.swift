//
//  UserViewModel.swift
//  Twaddle
//
//  Created by Maraj Hossain on 7/13/23.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [User] = []

//    func fetchUser() {
//        // Check if URL is correct
//        guard let url = URL(string: "https://gorest.co.in/public/v2/users") else {
//            print("Invalid URL")
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error here of: \(error.localizedDescription)")
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                print("Invalid response")
//                return
//            }
//
//            if let data = data {
//                do {
//                    let decodedData = try JSONDecoder().decode([User].self, from: data)
//                    DispatchQueue.main.async {
//                        self.users = decodedData
//                    }
//                } catch {
//                    print("Error decoding JSON: \(error)")
//                }
//            }
//        }
//        .resume()
//    }

    func fetchUser() {
        // take  url
        guard let url = URL(string: "https://gorest.co.in/public/v2/users") else {
            return
        }

        // do task on url to get data and check for error
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }

            // convert to JSON to data
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
