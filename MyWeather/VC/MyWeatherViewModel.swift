//
//  MyWeatherViewModel.swift
//  MyWeather
//
//  Created by 김윤우 on 7/13/24.
//

import Foundation
import Alamofire

class MyWeatherViewModel {
    
    var inputViewDidLoadTrigger: Observable<Void?> = Observable(nil)
    var outputWeahterData: Observable<Weathers?> = Observable(nil)
    var outputNowDate: Observable<String?> = Observable("")
    var outputDecimalPointFormat: Observable<String?> = Observable(nil)
    
    init() {
        transfrom()
    }
   
    private func transfrom() {
        inputViewDidLoadTrigger.bind { _ in
            self.callRequest()
            self.outputNowDate.value = self.nowDate()
        }
    }
    
    private func callRequest() {
        APIManeger.shared.fetchGetWeather { weather in
            self.outputWeahterData.value = weather
            self.outputDecimalPointFormat.value = self.decimalPointFormatter(newValue: weather.main.temp)
        }
    }
    
    private func nowDate() -> String {
        let date =  Date()
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "M월 dd일 H시 mm분"
        let dateString = myFormatter.string(from: date)
        return dateString
    }
    
   private func decimalPointFormatter(newValue:Double) -> String {
        
        let value: Double = newValue
        let str = String(format: "%.1f", value  - 273.15 )
        return str
    }
    
}
