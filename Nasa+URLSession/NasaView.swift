//
//  NasaView.swift
//  MyWeather
//
//  Created by 김윤우 on 7/1/24.
//

import UIKit

// 부, 뷰컨을 나눴을 때의 장단점에 대한 생각.
// 액션을
final class NasaView: BaseView {
      var apiRequestButton = {
        let view = UIButton()
        view.backgroundColor = .systemBlue
        return view
    }()
      let nasaImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemGray5
        return view
    }()
      let progressLabel = {
        let view = UILabel()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    override func setUpHierarachy() {
        [apiRequestButton, nasaImageView, progressLabel].forEach {
            self.addSubview($0)
        }
    }
    
    override func setUpLayout() {
        apiRequestButton.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        nasaImageView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide).inset(20)
            make.top.equalTo(progressLabel.snp.bottom).offset(20)
        }
        progressLabel.snp.makeConstraints { make in
            make.top.equalTo(apiRequestButton.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
    }
    
}
