//
//  BookDetailView.swift
//  BookSearch
//
//  Created by Chris Shireman on 10/26/22.
//

import SwiftUI

struct BookDetailView: View {
    var book: Book
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 8) {
                BookThumbnail(book: book)
                    .padding()
                    .frame(height: 250)
                    
                Text(book.title)
                    .font(.title)
                    .lineLimit(3)
                
                Text(book.combinedAuthors)
                    .font(.title2)
                    .lineLimit(3)
                
                Text(book.description ?? "Description Unavailable")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .padding(16)
            
            }
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(book: .empty)
    }
}
