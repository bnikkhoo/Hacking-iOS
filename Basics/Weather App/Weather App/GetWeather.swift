//
//  GetWeather.swift
//  Weather App
//
//  Created by Babak Nikkhoo on 6/7/16.
//  Copyright © 2016 Babak Nikkhoo. All rights reserved.
//

import Foundation

class WeatherBrain {
    
    func cityFormat (city: String) -> [String] {
        
        let noSpacesCity = (city.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()))
        
        let newFormatCity = noSpacesCity.stringByReplacingOccurrencesOfString(" ", withString: "-")
        
        let url = "http://www.weather-forecast.com/locations/" + newFormatCity + "/forecasts/latest"
        
        return [noSpacesCity, url]
    }
    
    
    func cityUrl (cityUrl: String) -> NSURL {
        
        let url = NSURL(string: cityUrl)!
        
        return url
    }
}