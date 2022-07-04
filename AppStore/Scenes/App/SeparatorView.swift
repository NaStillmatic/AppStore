//
//  SeparatorView.swift
//  AppStore
//
//  Created by HwangByungJo  on 2022/07/04.
//

import UIKit
import SnapKit

final class SeparatorView: UIView {
  private lazy var separator: UIView = {
    let separator = UIView()
    separator.backgroundColor = .separator
    return separator
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(separator)
    separator.snp.makeConstraints {
      $0.leading.equalToSuperview().inset(16.0)
      $0.top.trailing.equalToSuperview()
      $0.height.equalTo(0.5)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(codeer: has not been implemented")
  }
}


