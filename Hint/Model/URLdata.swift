//
//  URLdata.swift
//  Hint
//
//  Created by Steven Taglohner on 04/11/2017.
//  Copyright © 2017 Steven Taglohner. All rights reserved.
//

import Foundation

struct TasteDiveURL {
    static let Scheme = "https"
    static let Host = "tastedive.com"
    static let Path = "/api/similar"
    
    struct ParametersKeys {
        static let query = "q"
        static let type = "type"
        static let info = "info"
        static let limit = "limit"
        static let APIAccessKey = "k"
    }
    
    struct ParametersResponse {
        static let query = "Harry Potter"
        static let type = "movies"
        static let info = "1"
        static let limit = "20"
        static let APIAccessKey = "289159-MediaHin-NI7H07UR"
    }
}
