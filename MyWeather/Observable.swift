//
//  Observable.swift
//  MyWeather
//
//  Created by 김윤우 on 7/13/24.
//

import Foundation

class Observable<T> {
    var closure: ((T) -> Void)?
    
    var value: T {
        didSet{
            closure?(value)
        }
    }
    init(_ value: T) {
        self.value = value
    }
    func bind(closure: @escaping (T) -> Void) {
        closure(value)
        self.closure = closure
    }
}
