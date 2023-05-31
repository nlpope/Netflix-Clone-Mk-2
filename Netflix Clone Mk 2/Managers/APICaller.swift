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
    private init() {}
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> ()) {
                
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
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
    
    func getTrendingTVs(completion: @escaping (Result<[Title], Error>) -> ()) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { dataReceived, _, error in
            guard let dataReceivedCopy = dataReceived, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: dataReceivedCopy)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    //need popular and top rated - after upcoming
    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> ()) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { dataReceived, _, nonDotFailureError in
            guard let dataReceivedCopy = dataReceived, nonDotFailureError == nil else {return}
            
            do {
                let decoder = JSONDecoder()
                let finalResult = try decoder.decode(TrendingTitleResponse.self, from: dataReceivedCopy)
                completion(.success(finalResult.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> ()) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { dataReceived, _, error in
            guard let dataReceivedCopy = dataReceived, error == nil else {return}
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(TrendingTitleResponse.self, from: dataReceivedCopy)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> ()) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { dataReceived, _, errorReceived in
            guard let dataReceivedCopy = dataReceived, errorReceived == nil else {return}
            
            do {
                let decoder = JSONDecoder()
                let finalResult = try decoder.decode(TrendingTitleResponse.self, from: dataReceivedCopy)
                completion(.success(finalResult.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
