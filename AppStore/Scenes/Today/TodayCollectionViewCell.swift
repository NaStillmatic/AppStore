//
//  TodayCollectionViewCell.swift
//  AppStore
//
//  Created by HwangByungJo  on 2022/07/01.
//

import UIKit
import SnapKit
import Kingfisher

final class TodayCollectionViewCell: UICollectionViewCell {
  
  private lazy var titleLabel: UILabel = {
    let label  = UILabel()
    label.font = .systemFont(ofSize: 24, weight: .bold)
    label.textColor = .white
    return label
  }()
  
  private lazy var subTitleLabel: UILabel = {
    let label  = UILabel()
    label.font = .systemFont(ofSize: 14, weight: .bold)
    label.textColor = .white
    return label
  }()
  
  private lazy var descriptionLabel: UILabel = {
    let label  = UILabel()
    label.font = .systemFont(ofSize: 14, weight: .bold)
    label.textColor = .white
    return label
  }()
  
  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 12.0
    imageView.backgroundColor = .gray
    return imageView
  }()
      
  func setUp(today: Today) {
    setupSubViews()
    
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.3
    layer.shadowRadius = 10
    
    subTitleLabel.text =  today.subTitle
    descriptionLabel.text = today.description
    titleLabel.text = today.title
    
    if let imageUrl = URL(string: today.imageURL) {
      imageView.kf.setImage(with: imageUrl)
    }        
  }
}

private extension TodayCollectionViewCell {
  func setupSubViews() {
    [imageView, titleLabel, subTitleLabel, descriptionLabel]
      .forEach { contentView.addSubview($0) }
    
    subTitleLabel.snp.makeConstraints {
      $0.leading.trailing.top.equalToSuperview().inset(24)
    }
    
    titleLabel.snp.makeConstraints {
      $0.leading
        .trailing
        .equalTo(subTitleLabel)
      $0.top.equalTo(subTitleLabel.snp.bottom).offset(4.0)
    }
    
    descriptionLabel.snp.makeConstraints {
      $0.leading
        .trailing
        .bottom.equalToSuperview().inset(24)
    }
   
    imageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
  }
}
