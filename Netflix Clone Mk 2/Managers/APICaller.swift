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
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { dataReceived, _, error in
            guard let data = dataReceived, error == nil else {return}
            do {
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(results)
                let decoder = JSONDecoder()
            
                //gotcha! error somewhere in this line
                let results: TrendingTitleResponse = try decoder.decode(TrendingTitleResponse.self, from: data)
                print("response egualez: \(results)")
            } catch {
                print("your error brought to you by \(error)")
            }
        }
        task.resume()
    }
    
}

//Replacing the JSONSerialization to JSONDecoder (which does not throw an error?
//next: reviewing URLSession documentation
