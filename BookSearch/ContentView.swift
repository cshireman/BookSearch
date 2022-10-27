//
//  ContentView.swift
//  BookSearch
//
//  Created by Chris Shireman on 10/26/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            BooksView(model: BooksViewModel())
            BookDetailView(book: .empty)
        }
        .accentColor(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
