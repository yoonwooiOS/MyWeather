//
//  CustomImageView.swift
//  MyWeather
//
//  Created by 김윤우 on 6/19/24.
//

import UIKit
import Kingfisher

class WeatherImageView: UIImageView {

    init(urlString: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
     
        let urlString = URL(string: urlString)
        
        kf.setImage(with: urlString)
        contentMode = .scaleToFill
        layer.cornerRadius = 4
        self.backgroundColor = backgroundColor
        
       
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
