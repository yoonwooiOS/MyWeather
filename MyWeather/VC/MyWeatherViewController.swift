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
    
    
        
    let mainView = MyWeatherView()
    
    let locationManager = CLLocationManager()
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUpButton()
    }
    
     override func setUpView() {
        view.backgroundColor = .brown
        locationManager.delegate = self
    }
    
    func setUpButton() {
        mainView.reloadButton.addTarget(self, action: #selector(reloadButtonTapped), for: .touchUpInside)
    }
    
    
    
    
    
    @objc func reloadButtonTapped() {
        NetworkService.getWeather { value in
            self.mainView.weatherdata = value
        }
    }
}

extension MyWeatherViewController {
    // 1. 사용자에게 권한 요청을 하기 위해, iOS 위치 서비스 활성화 여부 체크
    func checkDeviceLocationAuthorization() {
        // static 메서드
        if CLLocationManager.locationServicesEnabled() {
            
            // 2. 현재 사용자 위치 권한 상태 확인
            checkCurrentLoactionAuthoriztion()
        } else {
            print("위치 서비스가 꺼져 있어서, 위치 권한 요청을 할 수 없어요.")
        }
    }
    
    func checkCurrentLoactionAuthoriztion() {
        
        var status: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            
            status = locationManager.authorizationStatus
            
        } else {
            
            status = CLLocationManager.authorizationStatus()
            
        }
        
        
        switch status {
        case .notDetermined:
            print("이 권한 문구를 띄울 수 있음")
            //info plist 권한과 같아야 함
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            print("iOS 설정 창으로 이동하라는 얼럿을 띄워주기")
            
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation() // locationManager 실행
            print("위치 정보 알려달라고 로직 구성할 수 있음")
            
            //        모든 케이스가 대응 될 때
            //        나중에 추가되는 case가 늘어날 수도 있으니까 미래 버전을 대응하기 위해 코드를 작성해놓는게 좋지 않을까?
        default:
            print(status)
        }
    }
}

//not deter
//3. 위치 관련 프로토콜 선언: CLLocationManagerDelegate
extension MyWeatherViewController: CLLocationManagerDelegate {
    //5. 사용자 위치를 성공적으로 가지고 온 경우
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function)
        print(locations)
        // stratUpdatingLocation을 했으면 더이상 위치를 안받아도 되는 시점에서는 stop을 해줘야함
        
        if let coordinate = locations.last?.coordinate {
            
            print(coordinate)
            print(coordinate.latitude)
            print(coordinate.longitude)
            
            APICoordinate.latitude = String(coordinate.latitude)
            APICoordinate.longitude = String(coordinate.longitude)
            print(#function, APICoordinate.latitude,  APICoordinate.longitude)
            //MARK: 네트워크 분리 후 호출
            NetworkService.getWeather { value in
                self.mainView.weatherdata = value
            }
        }
        self.locationManager.stopUpdatingLocation()
    }
    //6. 사용자 위치를 가지고 오지 못했거나
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(#function)
    }
    //7. 사용자 권한 상태 변경(iOS14+ 기준으로 나뉨) + 인스턴스가 생성이 될 때도 호출됨
    //    사용자가 허용했었는데 아이폰 설정에서 나중에 허용을 거부했을 때
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function, "iOS14+")
        checkDeviceLocationAuthorization()
    }
    
    // 14이상 duplecate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(#function, "iOS14-")
        
    }
}

