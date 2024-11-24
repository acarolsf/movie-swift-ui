//
//  PageData.swift
//  myAppTest
//
//  Created by Ana Carolina on 23/11/24.
//

import Foundation

struct PageData: Codable {
    let search: [Movie]
    let totalResults: String
    let response: String
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}
