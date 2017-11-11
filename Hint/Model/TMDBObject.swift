//
//  TMDBObject.swift
//  Hint
//
//  Created by Steven Taglohner on 07/11/2017.
//  Copyright © 2017 Steven Taglohner. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let vote_count: Int
    let id: Int
    let vote_average: Float
    let title: String
    let popularity: Float
    let original_language: String
    let original_title: String
    let genre_ids: [Int]
    let backdrop_path: String?
    let poster_path: String?
    let overview: String
    let release_date: String?
}

struct TMDBMovieObject: Decodable {
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [Results]
}
