//
//  HTTP.swift
//  Decide For Me!
//
//  Created by Akheron on 4/21/18.
//  Copyright © 2018 Lifely. All rights reserved.
//

import Foundation

class YelpHTTP {
    static func getMany(latitude Latitude: String, longtitude Longtitude: String) -> Businesses{
        
        let url = URL(string: "https://api.yelp.com/v3/businesses/search?text=del&latitude=" + Latitude + "&longitude=" + Longtitude)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("Bearer vbE9sKBXuhf07aNjLKnMEVuEmQl3wWorOFsORfmfEno04pb4SVoeM78KIMRDd0zkiN1aDAvsYX3Dwit4hLuR9YH9vXXEYvph2vv_eovMWsEziorHQvfOz7RWfVTMWnYx", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else {return}
            
            do {
                let restaurants = try JSONDecoder().decode(Businesses.self, from: data)
            } catch let err {
                print(err)
            }
        }).resume()
        return restaurants
    }
}
