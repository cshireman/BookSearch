//
//  BookView.swift
//  BookSearch
//
//  Created by Chris Shireman on 10/26/22.
//

import SwiftUI

struct BooksView: View {
    @ObservedObject var model: BooksViewModel
    
    var body: some View {
        VStack {
            if !model.isSearching {
                if model.searchResults.count == 0 {
                    Text(model.emptyTitle)
                        .font(.title)
                    Text(model.emptySubtitle)
                        .font(.subheadline)
                } else {
                    List {
                        ForEach(model.searchResults, id: \.id) { result in
                            NavigationLink(destination: BookDetailView(book: result.volumeInfo)) {
                                BookResultView(result: result)
                            }
                        }
                    }
                    .listStyle(.inset)
                    .padding()
                }
                
            } else {
                ProgressView("Searching...")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $model.searchQuery, placement: .automatic, prompt: "Search Title, Author, or ISBN")
        .onSubmit(of: .search) {
            model.searchBooks()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Search Books")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding()
            }
        }
        .alert(model.errorMessage, isPresented: $model.showError) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView(model: BooksViewModel())
    }
}
