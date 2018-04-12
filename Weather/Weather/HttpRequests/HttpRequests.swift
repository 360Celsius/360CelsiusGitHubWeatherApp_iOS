//
//  HttpRequests.swift
//  Weather
//
//  Created by Dennis Shar on 07/04/2018.
//  Copyright © 2018 Dennis Shar. All rights reserved.
//

import Foundation

class HttpRequests {
    
    let constant:HttpRequestsConstant
    let jsonParser:JasonParser
    
    init (){
        constant = HttpRequestsConstant()
        jsonParser = JasonParser()
    }
    
    func runHttpRequestGetExternalIp(complition: @escaping (_ result: String)->Void) {
        let url = URL(string: "\(constant.externalIpUrl)")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let data = data {
                do {
                    // Convert the data to JSON
                    let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                    self.jsonParser.parseExternalIPDataResponcer(jsonToParse:jsonSerialized as AnyObject)
                }  catch let error as NSError {
                    print(error.localizedDescription)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    func runHttpRequestGetCityNameByIp(externalIP:String, complition: @escaping (_ result: String)->Void) {
        let url = URL(string: "\(constant.locationByExternalIpUrl)\(externalIP)")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let data = data {
                do {
                    // Convert the data to JSON
                    let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                    
                    if let json = jsonSerialized, let base = json["base"] {
                        print(base)
                        complition(base as! String)
                    }
                    
                }  catch let error as NSError {
                    print(error.localizedDescription)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
    
    func runHttpRequestCurrentWeatherData(cityName:String, tempUnits:String ,complition: @escaping (_ result: String)->Void) {
        let url = URL(string: "\(constant.apiUrl)weather?q=\(cityName)&units=\(tempUnits)&APPID=\(constant.apiKey)")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let data = data {
                do {
                    // Convert the data to JSON
                    let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                    
                    if let json = jsonSerialized, let base = json["base"] {
                        print(base)
                        complition(base as! String)
                    }
                    
                }  catch let error as NSError {
                    print(error.localizedDescription)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
    
    func runHttpRequestFiveDaysThreeHourForecastData(cityName:String, tempUnits:String,complition: @escaping (_ result: String)->Void) {
        let url = URL(string:  "\(constant.apiUrl)forecast?q=\(cityName)&units=\(tempUnits)&APPID=\(constant.apiKey)")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let data = data {
                do {
                    // Convert the data to JSON
                    let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                    
//                    if let json = jsonSerialized, let base = json["base"] {
//                        //print(base)
//                        complition(base as! String)
//                    }
                    
                }  catch let error as NSError {
                    print(error.localizedDescription)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
    
    func runHttpRequestSixTennDaysForecastData(cityName:String, tempUnits:String ,complition: @escaping (_ result: String)->Void) {
        let url = URL(string:  "\(constant.apiUrl)forecast/daily?q=\(cityName)&units=\(tempUnits)&APPID=\(constant.apiKey)")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let data = data {
                do {
                    // Convert the data to JSON
                    let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                    
                    //                    if let json = jsonSerialized, let base = json["base"] {
                    //                        //print(base)
                    //                        complition(base as! String)
                    //                    }
                    
                }  catch let error as NSError {
                    print(error.localizedDescription)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
}