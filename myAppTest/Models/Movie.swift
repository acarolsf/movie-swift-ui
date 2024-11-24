//
//  Movie.swift
//  myAppTest
//
//  Created by Ana Carolina on 23/11/24.
//

import Foundation

struct Movie: Codable {
    let id: String
    let title: String
    let year: String
    let type: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case year = "Year"
        case type = "Type"
        case poster = "Poster"
    }
}
