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

enum APIError: Error {
    case failedToGetData, failedToSetData
}



class APICaller {
    static let shared = APICaller() //shared instance made so we can call all the below methods later
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> ()) {
                
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { dataReceived, _, error in
            
            guard let data = dataReceived, error == nil else {return}
            
            do {
                let decoder = JSONDecoder()
                let results: TrendingTitleResponse = try decoder.decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results)) //.success takes value of success parameter into HomeVC

            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTrendingTVs(completion: @escaping (Result<[String], Error>) -> ()) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { dataReceived, _, error in
            guard let data = dataReceived, error == nil else {return}
            
            do {
                let results = try JSONSerialization.jsonObject(with: data)
                print(results)
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
