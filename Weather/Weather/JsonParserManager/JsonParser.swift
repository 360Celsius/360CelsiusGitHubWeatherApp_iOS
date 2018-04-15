//
//  JsonParsers.swift
//  Weather
//
//  Created by Dennis Shar on 12/04/2018.
//  Copyright © 2018 Dennis Shar. All rights reserved.
//

import Foundation


class JasonParser {
    
    let externalIPObject:ExternalIPObject
    let cityByIPObject:CityByIPObject
    
    init(){
         externalIPObject = ExternalIPObject()
         cityByIPObject = CityByIPObject()
    }
    
    func parseExternalIPDataResponcer(jsonToParse:AnyObject) -> ExternalIPObject {
        
        if (jsonToParse as! NSDictionary)["ip"] as? String != nil {
            externalIPObject.ip = (jsonToParse as! NSDictionary)["ip"] as? String
        }else{
             externalIPObject.ip = ""
        }
        
        if (jsonToParse as! NSDictionary)["hostname"] as? String != nil {
            externalIPObject.hostname = (jsonToParse as! NSDictionary)["hostname"] as? String
        }else{
            externalIPObject.hostname = ""
        }
        
        if (jsonToParse as! NSDictionary)["city"] as? String != nil {
            externalIPObject.city = (jsonToParse as! NSDictionary)["city"] as? String
        }else{
            externalIPObject.city = ""
        }
        
        if (jsonToParse as! NSDictionary)["region"] as? String != nil {
            externalIPObject.region = (jsonToParse as! NSDictionary)["region"] as? String
        }else{
            externalIPObject.region = ""
        }
        
        if (jsonToParse as! NSDictionary)["country"] as? String != nil {
            externalIPObject.country = (jsonToParse as! NSDictionary)["country"] as? String
        }else{
            externalIPObject.country = ""
        }
        
        if (jsonToParse as! NSDictionary)["loc"] as? String != nil {
            externalIPObject.loc = (jsonToParse as! NSDictionary)["loc"] as? String
        }else{
            externalIPObject.loc = ""
        }
        
        if (jsonToParse as! NSDictionary)["org"] as? String != nil {
            externalIPObject.org = (jsonToParse as! NSDictionary)["org"] as? String
        }else{
            externalIPObject.org = ""
        }
        
        print("ip: \(externalIPObject.ip!)")
        print("hostname: \(externalIPObject.hostname!)")
        print("city: \(externalIPObject.city!)")
        print("region: \(externalIPObject.region!)")
        print("country: \(externalIPObject.country!)")
        print("loc: \(externalIPObject.loc!)")
        print("org: \(externalIPObject.org!)")
        
        return externalIPObject
    }
    
    func parseCityNameByIpPDataResponcer(jsonToParse:AnyObject) -> CityByIPObject{
        
        if (jsonToParse as! NSDictionary)["ip"] as? String != nil {
            cityByIPObject.ip = (jsonToParse as! NSDictionary)["ip"] as? String
        }else{
            cityByIPObject.ip = ""
        }
        
        
        
        print("ip: \(externalIPObject.ip!)")
        
        
        return cityByIPObject
    }
}
