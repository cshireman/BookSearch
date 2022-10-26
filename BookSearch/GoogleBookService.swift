//
//  GoogleBookService.swift
//  BookSearch
//
//  Created by Chris Shireman on 10/26/22.
//

import Foundation

class GoogleBookService {
    static let shared = GoogleBookService()
    
    let volumesUrl = "https://www.googleapis.com/books/v1/volumes"
    let apiKey = "AIzaSyCLmSN_2PS3-nhLFzZBWTC_Rb0yZL72Cew"
    
    func search(_ keywords: String) async throws -> [BookSearchResult] {
        let query = keywords.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: volumesUrl+"?q="+query+"&key="+apiKey) else { throw "Invalid URL" }

        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(BookSearchResponse.self, from: data)
        return result.items
    }
}
