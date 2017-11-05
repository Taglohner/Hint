//
//  NetworkRequest.swift
//  Hint
//
//  Created by Steven Taglohner on 04/11/2017.
//  Copyright © 2017 Steven Taglohner. All rights reserved.
//

import Foundation

class APIService {
    
    // MARK: Properties
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    func getMediaJSON() {
        
        let parameters = [
            TasteDiveURL.ParametersKeys.APIAccessKey : TasteDiveURL.ParametersResponse.APIAccessKey,
            TasteDiveURL.ParametersKeys.info : TasteDiveURL.ParametersResponse.info,
            TasteDiveURL.ParametersKeys.limit : TasteDiveURL.ParametersResponse.limit,
            TasteDiveURL.ParametersKeys.query : TasteDiveURL.ParametersResponse.query,
            TasteDiveURL.ParametersKeys.type : TasteDiveURL.ParametersResponse.type
            ] as [String:AnyObject]
        
        let url = URLFromParameters(parameters, TasteDiveURL.Scheme, TasteDiveURL.Host, TasteDiveURL.Path)
        
        session.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                print("Error returned: \(String(describing: error))")
                return
            }
            
            guard let data = data else {
                print("no data has been returned")
                return
            }
            
            do {
                let tasteDiveResult  = try self.decoder.decode(TasteDiveObject.self, from: data)
                
                print(tasteDiveResult.Similar.Info)
                
            } catch let error {
                print(error)
            }
            
            }.resume()
    }
    
    /* create a URL from parameters */
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
