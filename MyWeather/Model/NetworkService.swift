//
//  NetworkService.swift
//  MyWeather
//
//  Created by 김윤우 on 6/20/24.
//

import Foundation
import Alamofire

class NetworkService {
    
    static func getWeather(complitionHandler:@escaping (Weathers) -> Void) {
        
        let url = APIURL.weather
        print(APIURL.weather)
        let parm: Parameters = [
            "appid" : APIKey.weatherKey,
            "lat" :  APICoordinate.latitude,
            "lon" :  APICoordinate.longitude
        ]
        AF.request(url, parameters: parm).responseDecodable(of: Weathers.self){ response in
            switch response.result {
            case .success(let value):
                print("SUCCESS")
            
                complitionHandler(value)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    
    
    
    
    
}




