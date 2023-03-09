//
//  APICaller.swift
//  Netflix Clone Mk 2
//
//  Created by Noah Pope on 3/3/23.
//

import Foundation

struct Constants {
    static let API_KEY = "a33493c4a470b7abe6133ac90dfaed66"
}

class APICaller {
    static let shared = APICaller() //shared instance made so we can call all the below methods later
    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        
    }
    
}

//PAUSE: REVIEWING CLOSURES/COMPLETION HANDLERS
//-> Working practice problems for strong reference cycles for closures
