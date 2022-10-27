//
//  BookThumbnail.swift
//  BookSearch
//
//  Created by Chris Shireman on 10/26/22.
//

import SwiftUI

struct BookThumbnail: View {
    var book: Book
    
    var body: some View {
        AsyncImage(url: book.thumbnail) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure:
                Image("default-book")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .empty:
                ProgressView()
            @unknown default:
                Image("default-book")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct BookThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        BookThumbnail(book: .empty)
    }
}
