//
//  MyWeatherViewController.swift
//  MyWeather
//
//  Created by 김윤우 on 6/19/24.
//

import UIKit
import SnapKit
import CoreLocation
import Kingfisher

class MyWeatherViewController: BaseViewController {
   
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

    let locationManager = CLLocationManager()
    let viewModel = MyWeatherViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
    
    func bindData() {
        viewModel.inputViewDidLoadTrigger.value = ()
        viewModel.outputWeahterData.bind { [weak self] data in
            guard let self = self, let data, let temperature = self.viewModel.outputDecimalPointFormat.value else { return }
            self.locationLabel.text = data.name
            
            self.temperatureLabel.text = "지금은 \(temperature)도에요"
            self.temperatureLabel.backgroundColor = .white
            
            self.humidityLabel.text = "\(data.main.humidity)% 만큼 습해요!"
            self.humidityLabel.backgroundColor = .white
            
            self.windSpeedLabel.text = "\(data.wind.speed)m/s의 바람이 불어요!"
            self.windSpeedLabel.backgroundColor = .white
            let urlString = URL(string: "https://openweathermap.org/img/wn/\(data.weather[0].icon)@2x.png")
            self.weatherImage.kf.setImage(with: urlString)
            self.weatherImage.backgroundColor = .white
            self.messageLabel.text = "좋은하루 되세요!"
            self.messageLabel.backgroundColor = .white
            self.dateTimeLabel.text = self.viewModel.outputNowDate.value
        }
        
    }
    override func setUpHierachy() {
        [dateTimeLabel, locationSymbolLabel, locationLabel, reloadButton, shareButton, temperatureLabel, humidityLabel, weatherImage, windSpeedLabel, messageLabel].forEach {
            view.addSubview($0)
        }
    }
    override func setUpLayout() {
        dateTimeLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            
        }
        
        
        locationSymbolLabel.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(36)
            $0.size.equalTo(20)
            
        }
        
        locationLabel.snp.makeConstraints {
            
            $0.leading.equalTo(locationSymbolLabel.snp.trailing).offset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(36)
            $0.height.equalTo(20)
            
        }
        reloadButton.snp.makeConstraints {
            
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(36)
            $0.size.equalTo(20)
            
        }
        shareButton.snp.makeConstraints {
            
            $0.trailing.equalTo(reloadButton.snp.leading).offset(-20)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(36)
            $0.size.equalTo(20)
            
        }
        temperatureLabel.snp.makeConstraints {
            
            $0.top.equalTo(locationSymbolLabel.snp.bottom).offset(16)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(30)
        }
        
        humidityLabel.snp.makeConstraints {
            
            $0.top.equalTo(temperatureLabel.snp.bottom).offset(8)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(30)
        }
        
        weatherImage.snp.makeConstraints {
            
            $0.top.equalTo(humidityLabel.snp.bottom).offset(8)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.size.equalTo(140)
        }
        
        messageLabel.snp.makeConstraints {
            
            $0.top.equalTo(weatherImage.snp.bottom).offset(8)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(30)
        }
    }
     override func setUpView() {
        view.backgroundColor = .brown
//        locationManager.delegate = self
    }
    
    override func setUpButton() {
        reloadButton.addTarget(self, action: #selector(reloadButtonTapped), for: .touchUpInside)
    }
 
    
    @objc func reloadButtonTapped() {
        viewModel.inputViewDidLoadTrigger.value = ()
    }
}

//extension MyWeatherViewController {
//    // 1. 사용자에게 권한 요청을 하기 위해, iOS 위치 서비스 활성화 여부 체크
//    func checkDeviceLocationAuthorization() {
//        // static 메서드
//        if CLLocationManager.locationServicesEnabled() {
//            
//            // 2. 현재 사용자 위치 권한 상태 확인
//            checkCurrentLoactionAuthoriztion()
//        } else {
//            print("위치 서비스가 꺼져 있어서, 위치 권한 요청을 할 수 없어요.")
//        }
//    }
//    
//    func checkCurrentLoactionAuthoriztion() {
//        
//        var status: CLAuthorizationStatus
//        
//        if #available(iOS 14.0, *) {
//            
//            status = locationManager.authorizationStatus
//            
//        } else {
//            
//            status = CLLocationManager.authorizationStatus()
//            
//        }
//        
//        
//        switch status {
//        case .notDetermined:
//            print("이 권한 문구를 띄울 수 있음")
//            //info plist 권한과 같아야 함
//            locationManager.desiredAccuracy = kCLLocationAccuracyBest
//            locationManager.requestWhenInUseAuthorization()
//        case .denied:
//            print("iOS 설정 창으로 이동하라는 얼럿을 띄워주기")
//            
//        case .authorizedWhenInUse:
//            locationManager.startUpdatingLocation() // locationManager 실행
//            print("위치 정보 알려달라고 로직 구성할 수 있음")
//            
//            //        모든 케이스가 대응 될 때
//            //        나중에 추가되는 case가 늘어날 수도 있으니까 미래 버전을 대응하기 위해 코드를 작성해놓는게 좋지 않을까?
//        default:
//            print(status)
//        }
//    }
//}
////
//////not deter
//////3. 위치 관련 프로토콜 선언: CLLocationManagerDelegate
//extension MyWeatherViewController: CLLocationManagerDelegate {
//    //5. 사용자 위치를 성공적으로 가지고 온 경우
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print(#function)
//        print(locations)
//        // stratUpdatingLocation을 했으면 더이상 위치를 안받아도 되는 시점에서는 stop을 해줘야함
//        
//        if let coordinate = locations.last?.coordinate {
//            
//            print(coordinate)
//            print(coordinate.latitude)
//            print(coordinate.longitude)
//            
//            APICoordinate.latitude = String(coordinate.latitude)
//            APICoordinate.longitude = String(coordinate.longitude)
//            print(#function, APICoordinate.latitude,  APICoordinate.longitude)
//            //MARK: 네트워크 분리 후 호출
//            APIManeger.shared.fetchGetWeather { value in
//                self.mainView.weatherdata = value
//            }
//        }
//        self.locationManager.stopUpdatingLocation()
//    }
//    //6. 사용자 위치를 가지고 오지 못했거나
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
//        print(#function)
//    }
//    //7. 사용자 권한 상태 변경(iOS14+ 기준으로 나뉨) + 인스턴스가 생성이 될 때도 호출됨
//    //    사용자가 허용했었는데 아이폰 설정에서 나중에 허용을 거부했을 때
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        print(#function, "iOS14+")
//        checkDeviceLocationAuthorization()
//    }
//    
//    // 14이상 duplecate
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        print(#function, "iOS14-")
//        
//    }
//}

