//
//  BookSearchResult.swift
//  BookSearch
//
//  Created by Chris Shireman on 10/26/22.
//

import Foundation

struct BookSearchResponse: Decodable {
    let kind: String?
    let totalItems: Int?
    let items: [BookSearchResult]
}
