//
//  File.swift
//  Decide For Me!
//
//  Created by Akheron on 4/21/18.
//  Copyright © 2018 Lifely. All rights reserved.
//

import Foundation

class RestaurantFinder {
    let Latitude: String
    let Longtitude: String
    var restaurant: Restaurant?
    
    init(Latitude: String, Longitude: String){
        self.Latitude = Latitude
        self.Longtitude = Longitude
    }
    
    func getLatitude() -> String {
        return self.Latitude
    }
    
    func getLongtitude() -> String {
        return self.Longtitude
    }
    
    func getOne(completion: @escaping ((Restaurant) -> Void)) {
        
        let url = URL(string: "https://api.yelp.com/v3/businesses/search?text=del&latitude=" + self.Latitude + "&longitude=" + self.Longtitude)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("Bearer vbE9sKBXuhf07aNjLKnMEVuEmQl3wWorOFsORfmfEno04pb4SVoeM78KIMRDd0zkiN1aDAvsYX3Dwit4hLuR9YH9vXXEYvph2vv_eovMWsEziorHQvfOz7RWfVTMWnYx", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else {return}
            do {
                let restaurants = try JSONDecoder().decode(Businesses.self, from: data)
                let randomnum = Int(arc4random_uniform(UInt32(restaurants.businesses.count)))-1
                self.restaurant = restaurants.businesses[randomnum]
                completion(restaurants.businesses[randomnum])
            } catch let err {
                print(err)
            }
        }).resume()
        

    }
    
    
    
}

struct Restaurant: Decodable {
    let name: String?
    let image_url: String?
    let rating: Double?
    let price: String?
    let id: String?
}

struct Businesses: Decodable {
    let businesses: [Restaurant]
    let total: Int
}
