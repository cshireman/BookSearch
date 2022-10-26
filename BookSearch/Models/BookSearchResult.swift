//
//  BookSearchResult.swift
//  BookSearch
//
//  Created by Chris Shireman on 10/26/22.
//

import Foundation

struct BookSearchResult: Decodable {
    var id: String
    var volumeInfo: Book
}
