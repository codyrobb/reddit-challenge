//
//  Page.swift
//  Reddit
//
//  Created by Cody Robertson on 5/20/19.
//  Copyright © 2019 Cody Robertson. All rights reserved.
//

import Foundation


struct Page: Decodable, Equatable {

    /// The posts contained within the fetched page.
    let posts: [Post]

}


// MARK: -
// MARK: Codable

extension Page {

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case children = "children"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)

        posts = try data.decode([Post].self, forKey: .children)
    }

}
