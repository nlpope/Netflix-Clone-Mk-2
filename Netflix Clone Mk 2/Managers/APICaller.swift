//
//  APICaller.swift
//  Netflix Clone Mk 2
//
//  Created by Noah Pope on 3/3/23.
//

import Foundation

struct Constants {
    static let API_KEY = "a33493c4a470b7abe6133ac90dfaed66"
    static let baseURL = "https://api.themoviedb.org"
}

class APICaller {
    static let shared = APICaller() //shared instance made so we can call all the below methods later
    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/550?api_key=\(Constants.API_KEY)") else {return}
    }
    
}

//PAUSE: REVIEWING CLOSURES/COMPLETION HANDLERS
//-> Working more practice problems for strong reference cycles for closures before moving on to completion handlers
