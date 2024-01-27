//
//  UserViewModel.swift
//  Twaddle
//
//  Created by Maraj Hossain on 7/13/23.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [User] = []

    func fetchUser() {
        // Check if URL is correct
        guard let url = URL(string: "https://gorest.co.in/public/v2/users") else {
            print("Invalid URL")
            return
        }

        // start URL Session to process error, response and data
        URLSession.shared.dataTask(with: url) { data, response, error in

            // handle if error
            if let error = error {
                print("Error here of: \(error.localizedDescription)")
                return
            }

            // handle received response
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response")
                return
            }

            // handle data
            if let data = data {
                do {
                    // decode from JSON to data
                    let decodedData = try JSONDecoder().decode([User].self, from: data)
                    DispatchQueue.main.async {
                        self.users = decodedData
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        .resume()
    }
}
