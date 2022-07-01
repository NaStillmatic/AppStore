//
//  AppViewController.swift
//  AppStore
//
//  Created by HwangByungJo  on 2022/07/01.
//

import UIKit

final class AppViewController: UIViewController {
  
  private let scrollView = UIScrollView()
  private let contentView = UIView()
  private lazy var stackView: UIStackView = {
    let statckView = UIStackView()
    statckView.axis = .vertical
    statckView.distribution = .equalSpacing
    statckView.spacing = 0.0
    
    let featureSectionView = FeatureSectionView(frame: .zero)
    let rankingFeatureSectionView = UIView()
    let exchangeCodeButtonView = UIView()
    
    featureSectionView.backgroundColor = .red
    rankingFeatureSectionView.backgroundColor = .blue
    exchangeCodeButtonView.backgroundColor = .yellow
    
    [featureSectionView,
     rankingFeatureSectionView,
     exchangeCodeButtonView].forEach {
      statckView.addArrangedSubview($0)
    }
     
    return statckView
  }()
 
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationController()
    setupLayout()
  }
}

private extension AppViewController {
  func setupNavigationController() {
    navigationItem.title = "앱"
    navigationItem.largeTitleDisplayMode = .always
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  func setupLayout() {
    
    view.addSubview(scrollView)
    scrollView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      $0.bottom.leading.trailing.equalToSuperview()
    }
    
    scrollView.addSubview(contentView)
    contentView.snp.makeConstraints {
      $0.edges.equalToSuperview()
      $0.width.equalToSuperview()
    }
    
    contentView.addSubview(stackView)
    stackView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}



