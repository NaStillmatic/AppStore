//
//  TodayViewController.swift
//  AppStore
//
//  Created by HwangByungJo  on 2022/07/01.
//

import UIKit
import SnapKit

final class TodayViewController: UIViewController {
  
  private var todayList: [Today] = []
  
  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.delegate = self
    collectionView.dataSource = self
    
    collectionView.backgroundColor = .systemBackground
    collectionView.register(TodayCollectionViewCell.self, forCellWithReuseIdentifier: "todayCell")
    collectionView.register(TodayCollectionViewHeaderView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: "TodayCollectionViewHeaderView")
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(collectionView)
    
    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    fetchData()
    collectionView.reloadData()
  }
}


extension TodayViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return todayList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "todayCell", for: indexPath) as? TodayCollectionViewCell else { return UICollectionViewCell() }
    
    let today = todayList[indexPath.row]
    cell.setUp(today: today)
    return cell
    
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      viewForSupplementaryElementOfKind kind: String,
                      at indexPath: IndexPath) -> UICollectionReusableView {
    guard kind == UICollectionView.elementKindSectionHeader,
          let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                       withReuseIdentifier: "TodayCollectionViewHeaderView",
                                                                       for: indexPath) as? TodayCollectionViewHeaderView else { return UICollectionReusableView() }
    header.setupViews()
    return header
  }
  
}

extension TodayViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width - 32.0
    return CGSize(width: width, height: width)
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: collectionView.frame.width - 32.0, height: 100)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    let value: CGFloat = 16.0
    return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let today = todayList[indexPath.row]
    let vc = AppDetailViewController(today: today)
    present(vc, animated: true)
  }
}


private extension TodayViewController {
  
  func fetchData() {
    guard let url = Bundle.main.url(forResource: "Today", withExtension: "plist") else { return }
    
    do {
      let data = try Data(contentsOf: url)
      let result = try PropertyListDecoder().decode([Today].self, from: data)
      todayList = result
    } catch {
      print(error.localizedDescription)
    }
  }
}
