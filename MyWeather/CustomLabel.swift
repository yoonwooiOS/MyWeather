//
//  CustomLabel.swift
//  MyWeather
//
//  Created by 김윤우 on 6/19/24.
//

import UIKit


class CustomLabel: UILabel {
    
    init(text: String, textColor: UIColor, font: UIFont, backgroundColor: UIColor) {
        super.init(frame: .zero)
        
      
        self.text = text
        self.textColor = textColor
        self.font = font
        self.backgroundColor = backgroundColor
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
