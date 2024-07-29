//
//  JSONMapperTests.swift
//  TwaddleTests
//
//  Created by Maraj Hossain on 3/4/24.
//

import Foundation
@testable import Twaddle
import XCTest

class JSONMapperTests: XCTestCase {
    func test_with_valid_json_successfully_decoded() {
        XCTAssertNoThrow(try StaticJSONMapper.decode(
            file: "UsersStaticData",
            type: UsersReponse.self), "Mapper shouldn't throw an error.")
    }

    func test_with_missing_file_error_thrown() {
        XCTFail()
    }

    func test_with_invalid_json_error_thrown() {
        XCTFail()
    }
}
