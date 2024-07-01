//
//  NasaViewController.swift
//  MyWeather
//
//  Created by 김윤우 on 7/1/24.
//

import UIKit
private enum Nasa: String, CaseIterable {
    
    static let baseURL = "https://apod.nasa.gov/apod/image/"
    
    case one = "2308/sombrero_spitzer_3000.jpg"
    case two = "2212/NGC1365-CDK24-CDK17.jpg"
    case three = "2307/M64Hubble.jpg"
    case four = "2306/BeyondEarth_Unknown_3000.jpg"
    case five = "2307/NGC6559_Block_1311.jpg"
    case six = "2304/OlympusMons_MarsExpress_6000.jpg"
    case seven = "2305/pia23122c-16.jpg"
    case eight = "2308/SunMonster_Wenz_960.jpg"
    case nine = "2307/AldrinVisor_Apollo11_4096.jpg"
    
    static var photo: URL {
        return URL(string: Nasa.baseURL + Nasa.allCases.randomElement()!.rawValue)!
    }
}

final class NasaViewController: BaseViewController{
    
    private let mainView = NasaView()
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    private func setupButton() {
        mainView.apiRequestButton.addTarget(self, action: #selector(apiRequestButtonClicked), for: .touchUpInside)
        
    }
    
    private func apiCallRequest() {
        
    }
    @objc private func apiRequestButtonClicked() {
        
        
        
    }
}
    

extension NasaViewController: URLSessionDataDelegate {
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        <#code#>
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        <#code#>
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: (any Error)?) {
        <#code#>
    }
}
