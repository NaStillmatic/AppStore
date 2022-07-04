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
    let rankingFeatureSectionView = RankingFeatureSectionView(frame: .zero)
    let exchangeCodeButtonView = ExchangeCodeButtonView(frame: .zero)
    
    let spacingView = UIView()
    spacingView.snp.makeConstraints {
      $0.height.equalTo(100.0)
    }
    
    [
      featureSectionView,
      rankingFeatureSectionView,
      exchangeCodeButtonView,
      spacingView
    ].forEach {
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
      $0.bottom
        .leading
        .trailing.equalToSuperview()
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
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



