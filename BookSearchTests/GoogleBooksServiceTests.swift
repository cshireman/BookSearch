//
//  GoogleBooksServiceTests.swift
//  BookSearchTests
//
//  Created by Chris Shireman on 10/26/22.
//

import XCTest
@testable import BookSearch

final class GoogleBookServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGoogleBooksServiceExists() throws {
        guard GoogleBookService.shared is GoogleBookService else { XCTFail("Book service doesn't exist")}
    }

}
