//
//  Movie.swift
//  Netflix Clone Mk 2
//
//  Created by Noah Pope on 3/17/23.
//

import Foundation

struct TrendingTitleResponse: Codable {
//this wouldnt work if "results" went by any other name - matches url request > dataReceived
    let results: [Title]
}

//a single item in the above array
struct Title: Codable {
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
    }
        
    let identifier: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}


//https://api.themoviedb.org/3/trending/all/day?api_key=a33493c4a470b7abe6133ac90dfaed66
