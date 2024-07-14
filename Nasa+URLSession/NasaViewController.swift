////
////  NasaViewController.swift
////  MyWeather
////
////  Created by 김윤우 on 7/1/24.
////
//
//import UIKit
//private enum Nasa: String, CaseIterable {
//    
//    static let baseURL = "https://apod.nasa.gov/apod/image/"
//    
//    case one = "2308/sombrero_spitzer_3000.jpg"
//    case two = "2212/NGC1365-CDK24-CDK17.jpg"
//    case three = "2307/M64Hubble.jpg"
//    case four = "2306/BeyondEarth_Unknown_3000.jpg"
//    case five = "2307/NGC6559_Block_1311.jpg"
//    case six = "2304/OlympusMons_MarsExpress_6000.jpg"
//    case seven = "2305/pia23122c-16.jpg"
//    case eight = "2308/SunMonster_Wenz_960.jpg"
//    case nine = "2307/AldrinVisor_Apollo11_4096.jpg"
//    
//    static var photo: URL {
//        return URL(string: Nasa.baseURL + Nasa.allCases.randomElement()!.rawValue)!
//    }
//}
//
//
//final class NasaViewController: BaseViewController{
//    
//    private let mainView = NasaView()
//    
//    var buffer: Data?  {
//       didSet {
//           let result = Double(buffer?.count ?? 0) / total
//           let resultString = "\(String(format: "%.1f", result * 100 ))% / 100 "
//           mainView.progressLabel.text = resultString
//       }
//   }
//
//    private var total: Double = 0
//       
//    
//    override func loadView() {
//        view = mainView
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setupButton()
//    }
//    private func setupButton() {
//        mainView.apiRequestButton.addTarget(self, action: #selector(apiRequestButtonClicked), for: .touchUpInside)
//        
//    }
//    
//    private func apiCallRequest() {
//        mainView.apiRequestButton.isEnabled = false
//        let request = URLRequest(url: Nasa.photo)
//        let session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
//            
//        session.dataTask(with: request).resume()
//    }
//    @objc private func apiRequestButtonClicked() {
//        print(#function)
//        buffer = Data()
//        apiCallRequest()
//       
//        
//    }
//}
//    
//
//extension NasaViewController: URLSessionDataDelegate {
//    
//    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
//        print(#function, response)
//        
//        if let response = response as? HTTPURLResponse,(200...299).contains(response.statusCode) {
//            let contentLength = response.value(forHTTPHeaderField: "Content-Length")!
//            
//             total = Double(contentLength)!
//            
//             return .allow
//         } else {
//             return .cancel
//         }
//         
//    }
//    
//    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
//        print(#function, data)
//        buffer?.append(data)
//    }
//    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: (any Error)?) {
//        print(#function, error as Any)
//        if let error = error {
//            mainView.progressLabel.text = "에러 입니다."
//            mainView.nasaImageView.image = UIImage(named: "IU")
//            mainView.nasaImageView.contentMode = .scaleToFill
//        } else {
//            print("성공")
//            guard let buffer = buffer else {
//                print("nil","-------------------")
//                return
//            }
//            print(buffer,"213123123123123")
//            let image = UIImage(data: buffer)
//            mainView.nasaImageView.image = image
//           
//        }
//        mainView.apiRequestButton.isEnabled = true
//    }
//}
