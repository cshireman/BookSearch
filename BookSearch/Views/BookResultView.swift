//
//  BookResultView.swift
//  BookSearch
//
//  Created by Chris Shireman on 10/27/22.
//

import SwiftUI

struct BookResultView: View {
    var result: BookSearchResult
    
    var body: some View {
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
            }
        }
    }
}

struct BookResultView_Previews: PreviewProvider {
    static var previews: some View {
        BookResultView(result: .empty)
    }
}
