//
//  NetworkRequest.swift
//  Hint
//
//  Created by Steven Taglohner on 04/11/2017.
//  Copyright © 2017 Steven Taglohner. All rights reserved.
//

import Foundation
import CoreData

class APIService {
    
    // MARK: Properties
    let session = URLSession.shared
    let decoder = JSONDecoder()
    let coreDataStack = AppDelegate.stack
    
    /* JSON data request to TMDB */
    func TMDBRequest(parameters: [String:AnyObject], url: URL, completion: @escaping (_ error: String?,_ data: TMDBMovieObject?) -> Void) {
        
        session.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                completion(error?.localizedDescription, nil)
                return
            }
            
            guard let data = data else {
                completion("An error occurred parsing the data", nil)
                return
            }
            
            do {
                let movieObject = try self.decoder.decode(TMDBMovieObject.self, from: data)
                completion(nil, movieObject)
                
            } catch let error {
                completion(error.localizedDescription, nil)
            }
            
            }.resume()
    }
    
    /* get image data from a provided URL */
    func getImageData(_ stringURL: String, completion: @escaping (_ error: String?,_ imageData: Data?) -> Void) {
        
        guard let url = NSURL(string: stringURL) else {
            return completion("Provided URL is invalid.", nil)
        }
        
        let request = URLRequest(url: url as URL)
        session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            guard error == nil else {
                return completion(error?.localizedDescription ?? "Could not get the image data.", nil)
            }
            
            guard let data = data else {
                return completion(error?.localizedDescription ?? "Invalid image data.", nil)
            }
            
            completion(nil, data)
            
            }.resume()
    }
    
    /* create an URL from a provided set of parameters */
    func URLFromParameters(_ parameters: [String:AnyObject]?,_ scheme: String,_ host: String,_ path: String) -> URL {
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = [URLQueryItem]()
        
        if let parameters = parameters {
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                components.queryItems!.append(queryItem)
            }
        }
        return components.url!
    }
    
    /* singleton for the network tasks */
    class func sharedInstance() -> APIService {
        struct Singleton {
            static var sharedInstance = APIService()
        }
        return Singleton.sharedInstance
    }
}
