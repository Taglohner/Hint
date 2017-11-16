//
//  APIServiceExtension.swift
//  Hint
//
//  Created by Steven Taglohner on 07/11/2017.
//  Copyright © 2017 Steven Taglohner. All rights reserved.
//

import Foundation
import CoreData


extension APIService {
    
    // MARK: TMDB - Fetch data and save to the persistent store
    
    func searchMovie(query: String) {
        let parameters = [TMDB.ParametersKeys.AccessKey : TMDB.ParametersResponse.AccessKey, TMDB.ParametersKeys.QueryString : query] as [String:AnyObject]
        let url = URLFromParameters(parameters, TMDB.URL.Scheme, TMDB.URL.Host, TMDB.URL.Path + TMDB.Methods.Search)
        
        TMDBRequest(parameters: parameters, url: url) { (error, data) in
            
            guard error == nil else {
                print("") //PENDING IMPLEMENTATION
                return
            }
            guard let movies = data?.results else {
                print("") //PENDING IMPLEMENTATION
                return
            }
            self.validateMoviesAndSave(movies: movies)
        }
    }
    
    func getMoviesRecommendations(movieID: Int) {
        
        TMDB.Properties.MovieID = movieID
        
        let parameters = [TMDB.ParametersKeys.AccessKey : TMDB.ParametersResponse.AccessKey] as [String:AnyObject]
        let url = URLFromParameters(parameters, TMDB.URL.Scheme, TMDB.URL.Host, TMDB.URL.Path + TMDB.Methods.Recommendations)
        
        TMDBRequest(parameters: parameters, url: url) { (error, data) in
            
            guard error == nil else {
                print("") //PENDING IMPLEMENTATION
                return
            }
            guard let movies = data?.results else {
                print("") //PENDING IMPLEMENTATION
                return
            }
            self.validateMoviesAndSave(movies: movies)
        }
    }
    
    func validateMoviesAndSave(movies: [MovieInfo]) {
        
        for movie in movies {
            
            let id = movie.id
            let title = movie.title
            let overview = movie.overview ?? "Overview is not available."
            let releaseDate = movie.release_date ?? "Release date is not available."
            
            guard let posterPath = movie.poster_path else {
                return
            }
            
            getImageData(movieCoverURL(size: .Small, posterPath: posterPath)) { (error, data) in
                print(self.movieCoverURL(size: .Small, posterPath: posterPath))
                DispatchQueue.main.async {
                    self.saveMovie(title: title, overview: overview, releaseDate: releaseDate, id: id, coverImage: data)
                }
            }
        }
        coreDataStack.save()
    }
    
    func saveMovie(title: String, overview: String, releaseDate: String, id: Int, coverImage: Data?){
        let movie = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: coreDataStack.context) as! Movie
        
        movie.title = title
        movie.overview = overview
        movie.releaseDate = releaseDate
        movie.id = Int32(id)
        movie.coverImage = coverImage
        
    }
    
    enum ImageSize: String {
        case Small = "w320"
        case Medium = "w640"
        case Large = "w1280"
    }
    
    func movieCoverURL(size: ImageSize, posterPath: String) -> String {
        return TMDB.ImageData.mediaPath + size.rawValue + posterPath
    }
}


