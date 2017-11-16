//
//  Movie+CoreDataProperties.swift
//  Hint
//
//  Created by Steven Taglohner on 15/11/2017.
//  Copyright © 2017 Steven Taglohner. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var backdropPath: String?
    @NSManaged public var genreId: Int32
    @NSManaged public var id: Int32
    @NSManaged public var originalLanguage: String?
    @NSManaged public var originalTitle: String?
    @NSManaged public var overview: String?
    @NSManaged public var popularity: Int32
    @NSManaged public var posterPath: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var title: String?
    @NSManaged public var voteAverage: Int32
    @NSManaged public var voteCount: Int32
    @NSManaged public var coverImage: Data?

}
