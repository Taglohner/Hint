//
//  APIServiceExtension.swift
//  Hint
//
//  Created by Steven Taglohner on 07/11/2017.
//  Copyright © 2017 Steven Taglohner. All rights reserved.
//

import Foundation

extension APIService {
    
    // MARK: TMDB - Fetch data and save to the persistent store
    
    func searchMovie(query: String) {
        let parameters = [TMDB.ParametersKeys.AccessKey : TMDB.ParametersResponse.AccessKey, TMDB.ParametersKeys.QueryString : query] as [String:AnyObject]
        let url = URLFromParameters(parameters, TMDB.URL.Scheme, TMDB.URL.Host, TMDB.URL.Path + TMDB.Methods.Search)
        
        TMDBRequest(parameters: parameters, url: url) { (error, data) in
            
            // ASSIGN THE DATA
            
        }
    }
    
    // MARK: TMDB - Fetch data and save to the persistent store
    
    func getMoviesRecommendations(movieID: Int) {
        
        TMDB.Properties.MovieID = movieID
        
        let parameters = [TMDB.ParametersKeys.AccessKey : TMDB.ParametersResponse.AccessKey] as [String:AnyObject]
        let url = URLFromParameters(parameters, TMDB.URL.Scheme, TMDB.URL.Host, TMDB.URL.Path + TMDB.Methods.Recommendations)
        
        TMDBRequest(parameters: parameters, url: url) { (error, data) in
            
            // ASSIGN THE DATA
            
        }
    }
    
    
    
    
    
    
    
}


