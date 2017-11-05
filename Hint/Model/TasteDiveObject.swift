//
//  TasteDiveObject.swift
//  Hint
//
//  Created by Steven Taglohner on 04/11/2017.
//  Copyright © 2017 Steven Taglohner. All rights reserved.
//

import Foundation

struct Info: Decodable {
    let Name: String
    let `Type`: String
    let wTeaser: String
    let wUrl: String
    let yUrl: String
    let yID: String
}

struct Result: Decodable {
    let Name: String
    let `Type`: String
    let wTeaser: String
    let wUrl: String
    let yUrl: String
    let yID: String
}

struct Similar: Decodable {
    let Info: [Info]
    let Results: [Result]
}

struct TasteDiveObject: Decodable {
    let Similar: Similar
}


