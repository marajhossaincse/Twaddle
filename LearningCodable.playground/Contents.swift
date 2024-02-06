import UIKit

struct User: Codable {
    let username: String
    let occupation: String
}

// Step 1: Get the path to the Data.json file
if let path = Bundle.main.path(forResource: "Data", ofType: "json"),

   // Step 2: Get the contents of the file as data so that it can be used
   let data = FileManager.default.contents(atPath: path)
{
    // Decoding data to model
    let decoder = JSONDecoder()
    let users = try decoder.decode([User].self, from: data)
    dump(users)

    // Encoding model to data
    let encoder = JSONEncoder()
    let data = try encoder.encode(users)
    dump(String(data: data, encoding: .utf8))
}
