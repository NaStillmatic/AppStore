//
//  FeatureSectionCollectionViewCell.swift
//  AppStore
//
//  Created by HwangByungJo  on 2022/07/04.
//

import UIKit
import SnapKit


final class FeatureSectionCollectionViewCell: UICollectionViewCell {
  private lazy var typeLabel: UILabel = {
    let label = UILabel()
    label.textColor = .systemBlue
    label.font = .systemFont(ofSize: 12.0, weight: .semibold)
    return label
  }()
  
  private lazy var appNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.font = .systemFont(ofSize: 20, weight: .bold)
    return label
  }()
  
  private lazy var descriptonLabel: UILabel = {
    let label = UILabel()
    label.textColor = .secondaryLabel
    label.font = .systemFont(ofSize: 16.0, weight: .semibold)
    return label
  }()
  
  private lazy var imagageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 7.0
    imageView.layer.borderWidth = 0.5
    imageView.layer.borderColor = UIColor.separator.cgColor
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  func setup(feature: Feature) {
    setupLayout()
    
    typeLabel.text = feature.type
    appNameLabel.text = feature.appName
    descriptonLabel.text = feature.description
    
    if let imageURL = URL(string: feature.imageURL) {
      imagageView.kf.setImage(with: imageURL)
    }    
  }
}

private extension FeatureSectionCollectionViewCell  {
  func setupLayout() {
    [
      typeLabel,
      appNameLabel,
      descriptonLabel,
      imagageView
    ].forEach { addSubview($0)}
    
    typeLabel.snp.makeConstraints {
      $0.leading.trailing.top.equalToSuperview()
    }
    
    appNameLabel.snp.makeConstraints {
      $0.leading
        .trailing.equalToSuperview()
      $0.top.equalTo(typeLabel.snp.bottom)
    }
    
    descriptonLabel.snp.makeConstraints {
      $0.leading
        .trailing.equalToSuperview()
      $0.top.equalTo(appNameLabel.snp.bottom).offset(4.0)
    }
    
    imagageView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.top.equalTo(descriptonLabel.snp.bottom).offset(8.0)
      $0.bottom.equalToSuperview().inset(8.0)
    }
  }
}

