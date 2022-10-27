//
//  BookSearchModel.swift
//  BookSearch
//
//  Created by Chris Shireman on 10/26/22.
//

import SwiftUI

class BookSearchModel: ObservableObject {
    static let shared = BookSearchModel()
    
    @Published var books: [BookSearchResult] = [BookSearchResult.empty]
}
