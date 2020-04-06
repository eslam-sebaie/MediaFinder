//
//  ApiManager.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/31/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import Alamofire
class APIManager: NSObject {

    class func loadItunes(mediaType: String, criteria: String, completion: @escaping (_ error: Error?, _ movies: [MediaData]?) -> Void){
        Alamofire.request(Urls.url, method: HTTPMethod.get, parameters: ["term":mediaType, "media":criteria], encoding: URLEncoding.default, headers: nil).response { response in
                    guard response.error == nil else {
                        print(response.error!)
                        completion(response.error, nil)
                        return
                    }
                   guard let data = response.data else {
                       print("didn't get any data from API")
                       return
                   }
            
            do {
                let decoder = JSONDecoder()
                let mediaArr = try decoder.decode(Media.self, from: data).results
                completion(nil, mediaArr)
            } catch let error {
                print(error)
            }
        }
        
    }
}



/*
 
 let moviesArr = try decoder.decode(MyResponse.self, from: data)

 
 
 {code: 202,
  message: "success",
  "data":[{
     "title": "Dawn of the Planet of the Apes",
     "image": "https://api.androidhive.info/json/movies/1.jpg",
     "rating": 8.3,
     "releaseYear": 2014,
     "genre": ["Action", "Drama", "Sci-Fi"]
    },
    {
     "title": "District 9",
     "image": "https://api.androidhive.info/json/movies/2.jpg",
     "rating": 8,
     "releaseYear": 2009,
     "genre": ["Action", "Sci-Fi", "Thriller"]
   },
   {
     "title": "Transformers: Age of Extinction",
     "image": "https://api.androidhive.info/json/movies/3.jpg",
     "rating": 6.3,
     "releaseYear": 2014,
     "genre": ["Action", "Adventure", "Sci-Fi"]
   }]
 }
 */
