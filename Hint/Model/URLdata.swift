//
//  URLdata.swift
//  Hint
//
//  Created by Steven Taglohner on 04/11/2017.
//  Copyright © 2017 Steven Taglohner. All rights reserved.
//

import Foundation

struct TMDB {
    
    struct Properties {
        static var MovieID = 0
    }
    
    struct URL {
        static let Scheme = "https"
        static let Host = "api.themoviedb.org"
        static let Path = "/3/"
    }
    
    struct Methods {
        static let Search = "search/movie"
        static let Recommendations = "movie/\(TMDB.Properties.MovieID)/recommendations"
    }

    struct ParametersKeys {
        static let AccessKey = "api_key"
        static let Language = "language"
        static let QueryString = "query"
    }
    
    struct ParametersResponse {
        static let AccessKey: String = "22cd7ed6d178b3a129678beb19b2a5f8"
        
    }
    
    // Poster path https://image.tmdb.org/t/p/w320
}
