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
    let currentWeatherDataObject: CurrentWeatherDataObject
    
    init(){
         externalIPObject = ExternalIPObject()
         cityByIPObject = CityByIPObject()
         currentWeatherDataObject = CurrentWeatherDataObject()
    }
    
    // parse external ip
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
        
        return externalIPObject
    }
    
    //parse city name by ip
    func parseCityNameByIpPDataResponcer(jsonToParse:AnyObject) -> CityByIPObject{
        
        if (jsonToParse as! NSDictionary)["ip"] as? String != nil {
            cityByIPObject.ip = (jsonToParse as! NSDictionary)["ip"] as? String
        }else{
            cityByIPObject.ip = ""
        }

        if (jsonToParse as! NSDictionary)["city"] as? String != nil {
            cityByIPObject.city = (jsonToParse as! NSDictionary)["city"] as? String
        }else{
            cityByIPObject.city = ""
        }
        
        if (jsonToParse as! NSDictionary)["region"] as? String != nil {
            cityByIPObject.region = (jsonToParse as! NSDictionary)["region"] as? String
        }else{
            cityByIPObject.region = ""
        }
        
        if (jsonToParse as! NSDictionary)["region_code"] as? String != nil {
            cityByIPObject.region_code = (jsonToParse as! NSDictionary)["region_code"] as? String
        }else{
            cityByIPObject.region_code = ""
        }
        
        if (jsonToParse as! NSDictionary)["country"] as? String != nil {
            cityByIPObject.country = (jsonToParse as! NSDictionary)["country"] as? String
        }else{
            cityByIPObject.country = ""
        }
        
        if (jsonToParse as! NSDictionary)["country_name"] as? String != nil {
            cityByIPObject.country_name = (jsonToParse as! NSDictionary)["country_name"] as? String
        }else{
            cityByIPObject.country_name = ""
        }
        
        if (jsonToParse as! NSDictionary)["continent_code"] as? String != nil {
            cityByIPObject.continent_code = (jsonToParse as! NSDictionary)["continent_code"] as? String
        }else{
            cityByIPObject.continent_code = ""
        }
        
        if (jsonToParse as! NSDictionary)["postal"] as? String != nil {
            cityByIPObject.postal = (jsonToParse as! NSDictionary)["postal"] as? String
        }else{
            cityByIPObject.postal = ""
        }
        
        if (jsonToParse as! NSDictionary)["latitude"] as? Double != nil {
            cityByIPObject.latitude = (jsonToParse as! NSDictionary)["latitude"] as? Double
        }else{
            cityByIPObject.latitude = 0
        }
        
        if (jsonToParse as! NSDictionary)["latitude"] as? Double != nil {
            cityByIPObject.longitude = (jsonToParse as! NSDictionary)["longitude"] as? Double
        }else{
            cityByIPObject.longitude = 0
        }
        
        if (jsonToParse as! NSDictionary)["timezone"] as? String != nil {
            cityByIPObject.timezone = (jsonToParse as! NSDictionary)["timezone"] as? String
        }else{
            cityByIPObject.timezone = ""
        }
        
        if (jsonToParse as! NSDictionary)["utc_offset"] as? String != nil {
            cityByIPObject.utc_offset = (jsonToParse as! NSDictionary)["utc_offset"] as? String
        }else{
            cityByIPObject.utc_offset = ""
        }
        
        if (jsonToParse as! NSDictionary)["country_calling_code"] as? String != nil {
            cityByIPObject.country_calling_code = (jsonToParse as! NSDictionary)["country_calling_code"] as? String
        }else{
            cityByIPObject.country_calling_code = ""
        }
        
        if (jsonToParse as! NSDictionary)["currency"] as? String != nil {
            cityByIPObject.currency = (jsonToParse as! NSDictionary)["currency"] as? String
        }else{
            cityByIPObject.currency = ""
        }
        
        if (jsonToParse as! NSDictionary)["languages"] as? String != nil {
            cityByIPObject.languages = (jsonToParse as! NSDictionary)["languages"] as? String
        }else{
            cityByIPObject.languages = ""
        }
        
        if (jsonToParse as! NSDictionary)["asn"] as? String != nil {
            cityByIPObject.asn = (jsonToParse as! NSDictionary)["asn"] as? String
        }else{
            cityByIPObject.asn = ""
        }
        
        if (jsonToParse as! NSDictionary)["org"] as? String != nil {
            cityByIPObject.org = (jsonToParse as! NSDictionary)["org"] as? String
        }else{
            cityByIPObject.org = ""
        }
        return cityByIPObject
    }
    
    //parse current wheather
    func parceCurrentWheatherDataResponce(jsonToParse:AnyObject)->CurrentWeatherDataObject{
        
        return currentWeatherDataObject
    }
}
