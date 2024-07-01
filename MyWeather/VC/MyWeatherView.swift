//
//  File.swift
//  MyWeather
//
//  Created by 김윤우 on 7/1/24.
//

import UIKit

class MyWeatherView: BaseView {
    
    var dateTimeLabel = CustomLabel(text: "" , textColor: .white, font: Label.Font.regular12, backgroundColor: .clear)
    let locationSymbolLabel = CustomSFSymbolButton(sfSymbolName: "location.fill", tintColor: .white)
    let locationLabel = CustomLabel(text: "", textColor: .white, font: Label.Font.bold16, backgroundColor: .clear)
    let shareButton = CustomSFSymbolButton(sfSymbolName: "square.and.arrow.up", tintColor: .white)
    let reloadButton = CustomSFSymbolButton(sfSymbolName: "arrow.clockwise", tintColor: .white)
    let temperatureLabel = PaddedLabel(padding: Label.Font.padding, text: "")
    let humidityLabel = PaddedLabel(padding: Label.Font.padding, text: "")
    let weatherImage = WeatherImageView(iconName: "", backgroundColor: .clear)
    let windSpeedLabel = PaddedLabel(padding: Label.Font.padding, text: "")
    let messageLabel = PaddedLabel(padding: Label.Font.padding, text: "")
    
    var weatherdata: Weathers = Weathers( weather: [Weather(main: "", description: "", icon: "")], main: Main(temp: 0.0, tempMin: 0.0, tempMax: 0.0, humidity: 0), wind: Wind(speed: 0), name: ""){
        
        didSet {
            locationLabel.text = weatherdata.name
            
            temperatureLabel.text = "지금은 \(decimalPointFormatter(newValue: (weatherdata.main.temp - 273.15)))도에요"
            temperatureLabel.backgroundColor = .white
            
            humidityLabel.text = "\(weatherdata.main.humidity)% 만큼 습해요!"
            humidityLabel.backgroundColor = .white
            
            windSpeedLabel.text = "\(weatherdata.wind.speed)m/s의 바람이 불어요!"
            windSpeedLabel.backgroundColor = .white
            let urlString = URL(string: "https://openweathermap.org/img/wn/\(weatherdata.weather[0].icon)@2x.png")
            weatherImage.kf.setImage(with: urlString)
            weatherImage.backgroundColor = .white
            messageLabel.text = "좋은하루 되세요!"
            messageLabel.backgroundColor = .white
            dateTimeLabel.text = nowDate()
        }
    }
    
    override func setUpHierarachy() {
        [dateTimeLabel, locationSymbolLabel, locationLabel, reloadButton, shareButton, temperatureLabel, humidityLabel, weatherImage, windSpeedLabel, messageLabel].forEach {
            self.addSubview($0)
        }
    }
    override func setUpLayout() {
        
        dateTimeLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(16)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(20)
            
        }
        
        
        locationSymbolLabel.snp.makeConstraints {
            $0.leading.equalTo(safeAreaLayoutGuide).offset(20)
            $0.top.equalTo(safeAreaLayoutGuide).offset(36)
            $0.size.equalTo(20)
            
        }
        
        locationLabel.snp.makeConstraints {
            
            $0.leading.equalTo(locationSymbolLabel.snp.trailing).offset(20)
            $0.top.equalTo(safeAreaLayoutGuide).offset(36)
            $0.height.equalTo(20)
            
        }
        reloadButton.snp.makeConstraints {
            
            $0.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            $0.top.equalTo(safeAreaLayoutGuide).offset(36)
            $0.size.equalTo(20)
            
        }
        shareButton.snp.makeConstraints {
            
            $0.trailing.equalTo(reloadButton.snp.leading).offset(-20)
            $0.top.equalTo(safeAreaLayoutGuide).offset(36)
            $0.size.equalTo(20)
            
        }
        temperatureLabel.snp.makeConstraints {
            
            $0.top.equalTo(locationSymbolLabel.snp.bottom).offset(16)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(30)
        }
        
        humidityLabel.snp.makeConstraints {
            
            $0.top.equalTo(temperatureLabel.snp.bottom).offset(8)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(30)
        }
        
        weatherImage.snp.makeConstraints {
            
            $0.top.equalTo(humidityLabel.snp.bottom).offset(8)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(20)
            $0.size.equalTo(140)
        }
        
        messageLabel.snp.makeConstraints {
            
            $0.top.equalTo(weatherImage.snp.bottom).offset(8)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(30)
        }
    }
    func decimalPointFormatter(newValue:Double) -> String {
        
        let value: Double = newValue
        let str = String(format: "%.1f", value)
        
        return str
    }
    
    func nowDate() -> String {
        
        let date =  Date()
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "M월 dd일 H시 mm분"
        let dateString = myFormatter.string(from: date)
        return dateString
    }
}

