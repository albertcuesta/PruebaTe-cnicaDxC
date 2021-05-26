//
//  MovieViewModel.swift
//  PruebaTécnicaDxC
//
//  Created by Albert on 26/5/21.
//

import Foundation

class MovieViewModel {
    
    private var apiService = MovieRequest()
    private var Movies = [MoviesDetail]()
    
    func fetchMoviesData(completion: @escaping () -> ()){
        apiService.getPopularMoviesData{ [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.Movies = listOf.movies
                completion()
            case .failure(let error):
                // Something is wrong with the JSON file or the model
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if Movies.count != 0{
            return Movies.count
        }
    return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> MoviesDetail {
        return Movies[indexPath.row]
    }
}
