//
//  PlaceholderError.swift
//  MVVMSwiftUICombine
//
//  Created by AMAR on 14/12/23.
//

import Foundation
enum PlaceholderError: Error{
    case networkError(description: String)
    case parsingError(description: String)
}
