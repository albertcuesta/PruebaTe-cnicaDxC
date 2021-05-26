//
//  MovieRequest.swift
//  PruebaTécnicaDxC
//
//  Created by Albert on 26/5/21.
//

import Foundation

class MovieRequest {
    private var dataTask: URLSessionDataTask?
    
    func getPopularMoviesData(completion: @escaping (Result<MoviesData, Error>) -> Void) {
        let resourceURL:URL
        let API_KEY = "087ded00713cbcc8a400c5b2a25c8cb4"
        let region = "Spain"
        
        let resourceString = "https://api.themoviedb.org/3/search/movie?api_key=\(API_KEY)&language=es_ES&query=1&page=1&include_adult=false&region=\(region)"
        
        guard let url = URL(string: resourceString)else {return}
        //creamos Url session
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else{
                print("empty response")
                return
            }
            
            print("response status code: \(response.statusCode)")
            
            guard let data = data else{
                print("empty data")
                return
            }
            do{
                //parseamos data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MoviesData.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            }catch let error{
                completion(.failure(error))
            }
            
        }
        dataTask?.resume()
    }
}


    

