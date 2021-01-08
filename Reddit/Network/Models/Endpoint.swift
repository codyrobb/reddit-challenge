//
//  Endpoints.swift
//  Reddit
//
//  Created by Cody Robertson on 5/20/19.
//  Copyright © 2019 Cody Robertson. All rights reserved.
//

import Foundation


enum Endpoint {

    /// Fetches posts from the home page of reddit.
    case home

    /// Fetches posts from the specific given subreddit.
    case subreddit(named: String)

}


// MARK: -
// MARK: Queries

extension Endpoint {

    /// The path for the specific endpoint.
    var path: String {
        switch self {
        case .home:
            return "https://www.reddit.com/.json"
        case .subreddit(let subreddit):
            return "https://www.reddit.com/r/" + subreddit + "/.json"
        }
    }

}
