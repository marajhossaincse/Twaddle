//
//  PostsViewModel.swift
//  Twaddle
//
//  Created by Maraj Hossain on 1/27/24.
//

import Foundation

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    func getPost() {
        // check url
        guard let url = URL(string: "https://gorest.co.in/public/v2/posts") else {
            return
        }
        
        // do task on url to download the data and check for error
        
        
        func loadPost() {
               // Check if URL is correct
               guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                   print("Invalid URL")
                   return
               }

               URLSession.shared.dataTask(with: url) { data, response, error in
                   if let error = error {
                       print("Error: \(error.localizedDescription)")
                       return
                   }

                   guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                       print("Invalid response")
                       return
                   }

                   if let data = data {
                       do {
                           let decodedData = try JSONDecoder().decode([Post].self, from: data)
                           DispatchQueue.main.async {
                               self.posts = decodedData
                           }
                       } catch {
                           print("Error decoding JSON: \(error)")
                       }
                   }
               }
               .resume()
           }
    }
}
