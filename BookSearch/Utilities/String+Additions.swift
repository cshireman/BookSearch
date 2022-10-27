//
//  String+Additions.swift
//  BookSearch
//
//  Created by Chris Shireman on 10/26/22.
//

import Foundation

extension String {
    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension String: LocalizedError {
    public var errorDescription: String? {
        return self
    }
}
