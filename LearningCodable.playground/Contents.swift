import UIKit

struct User: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let username: String
    let occupation: Occupation?
    let dateOfBirth: Date
    
    enum CodingKeys: String, CodingKey{
        case id = "userId"
        case firstName
        case lastName
        case username
        case occupation
        case dateOfBirth
    }
}

struct Occupation: Codable {
    let name: String
    let isActive: Bool
}

// Step 1: Get the path to the Data.json file
if let path = Bundle.main.path(forResource: "Data", ofType: "json"),

   // Step 2: Get the contents of the file as data so that it can be used
   let data = FileManager.default.contents(atPath: path)
{
    // Decoding data to model
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let users = try decoder.decode([User].self, from: data)
    dump(users)

    // Encoding model to data
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601
    encoder.keyEncodingStrategy = .convertToSnakeCase
    let data = try encoder.encode(users)
    dump(String(data: data, encoding: .utf8))
}
