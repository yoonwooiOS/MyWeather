//
//  BaseViewController.swift
//  MyWeather
//
//  Created by 김윤우 on 7/1/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpHierachy()
        setUpLayout()
        setUpView()
    }
    
    func setUpHierachy() { }
    func setUpLayout() { }
    func setUpView() { }
}
