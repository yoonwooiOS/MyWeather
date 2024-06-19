//
//  CustomSFSymbolButton.swift
//  MyWeather
//
//  Created by 김윤우 on 6/19/24.
//

import UIKit
import Kingfisher

class CustomSFSymbolButton: UIButton {

    init(sfSymbolName: String, tintColor: UIColor) {
        super.init(frame: .zero)
        
        setImage(UIImage(systemName: sfSymbolName), for: .normal)
        contentMode = .scaleToFill
        self.tintColor = tintColor
        backgroundColor = .clear
       
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
