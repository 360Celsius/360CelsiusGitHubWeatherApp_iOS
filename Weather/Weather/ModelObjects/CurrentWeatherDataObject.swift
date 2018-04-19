//
//  CurrentWeatherDataObject.swift
//  Weather
//
//  Created by Dennis Shar on 18/04/2018.
//  Copyright © 2018 Dennis Shar. All rights reserved.
//

import Foundation


class CurrentWeatherDataObject {
    
    var cord:Cord?
    class Cord{
        var lon:Double?
        var lat:Double?
    }
    
    var weather:[Weather]?
    class Weather{
        var id: Double?
        var main: String?
        var description: String?
        var icon: String?
    }
    
    var base:String?
    
    var main:Main?
    class Main{
        var temp: Double?
        var pressure: Double?
        var humidity: Double?
        var temp_min:Double?
        var temp_max:Double?
    }
    
    var visibility: Double?
    
    var wind: Wind?
    class Wind {
        var speed: Double?
        var deg: Double?
    }
    
    var clouds: Clouds?
    class Clouds{
        var all: Double?
    }
    
    var dt: Double?
    
    var sys: Sys?
    class Sys{
        var type: Double?
        var id: Double?
        var message: Double?
        var country: String?
        var sunrise: Double?
        var sunset: Double?
    }
    
    var id: Double?
    var name: String?
    var code: Double?
}
