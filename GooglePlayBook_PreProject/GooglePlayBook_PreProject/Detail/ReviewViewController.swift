//
//  ReviewViewController.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/11.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    // 데이터
    var reviewCount = ""
    var ratingCount = ""
    
    // 네비게이션
    private var navigationBarView: UIView = UIView()
    private var backButton: UIButton = UIButton()
    private var titleLabel: UILabel = UILabel()
    
    // scrollView
    private var scrollView: UIScrollView = UIScrollView()
    
    // contentView
    private var contentView: UIView = UIView()
    
    // ratingCountView
    let averageRatingGraphView = AverageRatingGraphView.view
        
    override func viewDidLoad() {
           super.viewDidLoad()

        setupNavigationBarLayout()
        setupContentViewLayout()

        averageRatingGraphView.setDataRatingGraphView(reviewCountString: reviewCount, ratingCountString: ratingCount)
    }
    // 상단 네비게이션 바
    private func setupNavigationBarLayout() {
        // 메인 배경화면 컬러
        view.backgroundColor = UIColor(named: "mainBackgroundColor")
        
        // 네비게이션 뷰
        view.addSubview(navigationBarView)
        navigationBarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            navigationBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            navigationBarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navigationBarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            navigationBarView.heightAnchor.constraint(equalToConstant: 44),
        ])
        navigationBarView.backgroundColor = .clear
        
        
        // 이전 버튼
        navigationBarView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: navigationBarView.topAnchor, constant: 0),
            backButton.bottomAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: 0),
            backButton.leadingAnchor.constraint(equalTo: navigationBarView.leadingAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 44),
        ])
        
        backButton.setImage(UIImage(named: "left_arrow.png"), for: .normal)
        backButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        backButton.backgroundColor = .clear
        
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
        // 제목
        navigationBarView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: navigationBarView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: navigationBarView.centerYAnchor),
        ])

        titleLabel.backgroundColor = .clear
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.text = "평점 및 리뷰"
    }
    
    private func setupContentViewLayout() {
        // scroll view
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        // content View
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
                contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
        // 평점 및 리뷰
        averageRatingGraphView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(averageRatingGraphView)

        NSLayoutConstraint.activate([
                averageRatingGraphView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                averageRatingGraphView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
                averageRatingGraphView.topAnchor.constraint(equalTo: contentView.topAnchor),
                averageRatingGraphView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    

    // action - back Button
    @objc func backButtonAction(sender: UIButton!) {
        self.dismissDetail()
    }
}
