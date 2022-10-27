//
//  BookSearchModel.swift
//  BookSearch
//
//  Created by Chris Shireman on 10/26/22.
//

import SwiftUI

@MainActor class BooksViewModel: ObservableObject {
    @Published var searchQuery = ""
    @Published var searchResults: [BookSearchResult] = []
    @Published var hasSearched: Bool = false
    @Published var isSearching: Bool = false
    
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    var emptyTitle: String {
        return hasSearched ? "No Results Available" : "Enter Your Search Above"
    }
    
    var emptySubtitle: String {
        return hasSearched ? "Please try your search again." : "Results will appear here."
    }
    
    func searchBooks() {
        if searchQuery.trimmed().isEmpty {
            searchResults = []
        } else {
            Task {
                do {
                    isSearching = true
                    searchResults = try await GoogleBookService.shared.search(searchQuery)
                    isSearching = false
                } catch {
                    isSearching = false
                    errorMessage = error.localizedDescription
                    showError = true
                }
            }
        }
    }
}
