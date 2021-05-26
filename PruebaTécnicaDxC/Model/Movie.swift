//
//  Movie.swift
//  PruebaTécnicaDxC
//
//  Created by Albert on 26/5/21.
//

import Foundation

struct MoviesData: Decodable{
    let movie:[MoviesDetail]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct MoviesDetail: Decodable {
    let id: Int?
    let original_title: String?
    let title: String?
    let original_language: String?
    let adult: Bool?
    let overview: String?
    let release_date: Date?
    let vote_count: Int?
    let video: Bool?
    let rate: Double?
    let posterImage: String?
    
    private enum CodingKeys: String, CodingKey {
        case title, overview
        case rate = "vote_average"
        case posterImage = "poster_path"
    }
    
}
