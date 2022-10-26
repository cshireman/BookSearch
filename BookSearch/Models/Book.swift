//
//  Book.swift
//  BookSearch
//
//  Created by Chris Shireman on 10/26/22.
//

import Foundation

struct Book: Decodable {
    var title: String
    var subtitle: String?
    var authors: [String]
    var authorsAsString: String?
    var description: String?
    
    var imageLinks: [String: String]?
    var imageUrlString: String?
}
