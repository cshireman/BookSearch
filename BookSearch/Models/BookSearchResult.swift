//
//  BookSearchResult.swift
//  BookSearch
//
//  Created by Chris Shireman on 10/26/22.
//

import Foundation

struct BookSearchResult: Decodable {
    static let empty = BookSearchResult(id: "-1", volumeInfo: Book.empty)
    
    var id: String
    var volumeInfo: Book
    
    var thumbnail: URL? {
        return volumeInfo.thumbnail
    }
    
    var title: String {
        return volumeInfo.title
    }
    
    var authors: String {
        return volumeInfo.combinedAuthors
    }
    
    var description: String? {
        return volumeInfo.description
    }
}

extension BookSearchResult: Hashable {
    static func == (lhs: BookSearchResult, rhs: BookSearchResult) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
