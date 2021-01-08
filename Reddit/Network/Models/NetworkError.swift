//
//  NetworkError.swift
//  Reddit
//
//  Created by Cody Robertson on 5/20/19.
//  Copyright © 2019 Cody Robertson. All rights reserved.
//

import Foundation


enum NetworkError: Error {

    /// The URL was invalid.
    case invalidURL

    /// The response was invalid and JSON parsing failed.
    case invalidResponse

    /// An error occurred but the exact reason is unknown or unvaluable.
    case unknownError(Error?)

}
