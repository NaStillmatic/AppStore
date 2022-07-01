//
//  FeatureSectionView.swift
//  AppStore
//
//  Created by HwangByungJo  on 2022/07/01.
//

import UIKit
import SnapKit

class FeatureSectionView: UIView {
  
  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.isPagingEnabled = true
    collectionView.backgroundColor = .systemBackground
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.register(UICollectionViewCell.self,
                            forCellWithReuseIdentifier: "FeatureSectionCollectionViewCell")
    return collectionView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension FeatureSectionView: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureSectionCollectionViewCell", for: indexPath) as? UICollectionViewCell else { return UICollectionViewCell() }
    
    cell.backgroundColor = .orange
    
    return cell
  }
}

extension FeatureSectionView: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width - 32.0, height: frame.width)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 32.0
  }
}

private extension FeatureSectionView {
  func setupViews() {
    
    [collectionView].forEach {
      addSubview($0)
    }
    
    collectionView.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
      $0.top.equalToSuperview().inset(16)
      $0.height.equalTo(snp.width)
    }
  }
}


extension FeatureSectionView: UICollectionViewDelegate {
  
}