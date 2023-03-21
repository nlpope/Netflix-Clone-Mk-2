//
//  Movie.swift
//  Netflix Clone Mk 2
//
//  Created by Noah Pope on 3/17/23.
//

import Foundation

struct TrendingMoviesResponse {
    //creating a structure for resulting data from URL session to be dumped in and used
    let results: [Title]
}

//a singlr item in the above array
struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}
