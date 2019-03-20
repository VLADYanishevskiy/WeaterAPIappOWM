//
//  NetworkManager.swift
//  WeaterAPIappOWM
//
//  Created by Владислав on 3/20/19.
//  Copyright © 2019 Владислав. All rights reserved.
//

import Foundation

class NetworkManager{
    private init() {}
    
    static let shared:NetworkManager = NetworkManager();
    
    func getWeather(city:String , result: @escaping ((OfferModel?) -> ())){
        
        var urlComponents = URLComponents();
        urlComponents.scheme = "https";
        urlComponents.host = "api.openweathermap.org";
        urlComponents.path = "/data/2.5/forecast";
        urlComponents.queryItems = [URLQueryItem(name : "q" , value : city),
                                    URLQueryItem(name: "APPID", value: "361cd229db838234853a15fc418214bf")];
        var request = URLRequest(url: urlComponents.url!);
        request.httpMethod = "GET";
        
        let task = URLSession(configuration: .default);
        task.dataTask(with: request){ (data , response , error) in
            if data != nil {
                let decoder = JSONDecoder()
                var decoderOfferModel:OfferModel?
                
                if data != nil{
                    decoderOfferModel = try? decoder.decode(OfferModel.self , from: data!)
                }
                
                result(decoderOfferModel)
            }else{
                print(error as Any)
            }
        }.resume()
        
    }
    
}
