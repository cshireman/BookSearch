//
//  BookView.swift
//  BookSearch
//
//  Created by Chris Shireman on 10/26/22.
//

import SwiftUI

struct BooksView: View {
    @State var searchQuery = ""
    @State var searchResults: [BookSearchResult] = []
    
    var body: some View {
        VStack {
          List {
            ForEach(searchResults, id: \.id) { result in
                NavigationLink(destination: BookDetailView(book: result.volumeInfo)) {
                    
                    HStack(alignment: .top) {
                        BookThumbnail(book: result.volumeInfo)
                            .frame(width: 75)
                        
                        VStack(alignment: .leading) {
                            Text(result.title)
                                .font(.headline)
                                .lineLimit(2)
                            
                            if !result.authors.isEmpty {
                                Text(result.authors)
                                    .font(.subheadline)
                                    .lineLimit(2)
                            }
                            
                            if let description = result.description {
                                Text(description)
                                    .font(.caption)
                                    .lineLimit(5)
                            }
                        }
                            
                    }
              }
            }
          }
          .listStyle(.inset)
          .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchQuery, placement: .automatic)
        .onSubmit(of: .search) {
            searchBooks()
        }
        .toolbar {
          ToolbarItem(placement: .principal) {
            Text("Books")
                  .foregroundColor(.black)
              .font(.largeTitle)
              .padding()
          }
        }
    }
    
    func searchBooks() {
        if searchQuery.trimmed().isEmpty {
            searchResults = []
        } else {
            Task {
                searchResults = try await GoogleBookService.shared.search(searchQuery)
            }
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView()
    }
}
