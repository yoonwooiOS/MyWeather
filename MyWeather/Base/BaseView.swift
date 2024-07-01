//
//  BaseView.swift
//  MyWeather
//
//  Created by 김윤우 on 7/1/24.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpHierarachy()
        setUpLayout()
        setUpView()
        backgroundColor = .white
    }
    
    func setUpHierarachy() { }
    func setUpLayout() { }
    func setUpView() { }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
