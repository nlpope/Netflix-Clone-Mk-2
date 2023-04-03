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

enum APIError: Error, CaseIterable {
    case failedToGetData, failedToSetData
    //pausing to research enums
}



class APICaller {
    static let shared = APICaller() //shared instance made so we can call all the below methods later
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        for errs in APIError.allCases {
            print("\(errs)")
        }
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { dataReceived, _, error in
            
            guard let data = dataReceived, error == nil else {return}
            do {
                let decoder = JSONDecoder()
                let results: TrendingTitleResponse = try decoder.decode(TrendingTitleResponse.self, from: data)

            } catch {
                print("your error brought to you by \(error)")
            }
        }
        task.resume()
    }
    
}
