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

    func testSearchFunctionExists() throws {
        Task {
            let results = try await GoogleBookService.shared.search("")
            XCTAssertGreaterThanOrEqual(0, results.count)
        }
    }
    
    func testSearchResultsBookResults() throws {
        Task {
            let results = try await GoogleBookService.shared.search("Harry Potter")
            XCTAssertGreaterThanOrEqual(10, results.count)
        }
    }
}
