//
//  String+Additions.swift
//  BookSearch
//
//  Created by Chris Shireman on 10/26/22.
//

import Foundation

extension String: LocalizedError {
  public var errorDescription: String? {
    return self
  }
}
