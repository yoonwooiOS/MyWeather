//
//  PaddingLabel.swift
//  MyWeather
//
//  Created by 김윤우 on 6/19/24.
//

import UIKit

class PaddedLabel: UILabel {
    var padding: UIEdgeInsets
    init(padding: UIEdgeInsets, text: String) {
        self.padding = padding
        super.init(frame: .zero)
        
        self.text = text
        self.textColor = .black
        self.font = Label.Font.regular14
        self.backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 8
        
    }

    required init?(coder: NSCoder) {
        self.padding = .zero
        super.init(coder: coder)
    }

    override func drawText(in rect: CGRect) {
        let paddedRect = rect.inset(by: padding)
        super.drawText(in: paddedRect)
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        let width = size.width + padding.left + padding.right
        let height = size.height + padding.top + padding.bottom
        return CGSize(width: width, height: height)
    }
}
