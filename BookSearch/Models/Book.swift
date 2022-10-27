//
//  Book.swift
//  BookSearch
//
//  Created by Chris Shireman on 10/26/22.
//

import Foundation

struct Book: Decodable {
    static var empty = Book(title: "", authors: [])
    
    var title: String
    var subtitle: String?
    var authors: [String]
    var authorsAsString: String?
    var description: String?
    
    var imageLinks: [String: String]?
    var imageUrlString: String?
    
    var combinedAuthors: String {
        return authorsAsString ?? authors.joined(separator: ", ")
    }
    
    var thumbnail: URL? {
        guard var secureImageLink = imageLinks?["thumbnail"] else { return nil }
        secureImageLink = secureImageLink.replacingOccurrences(of: "http:", with: "https:")
        return URL(string: secureImageLink)
    }
}
