//
//  InfoViewController.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/10.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    // 네비게이션
    private var navigationBarView: UIView = UIView()
    private var backButton: UIButton = UIButton()
    private var bookTitleLabel: UILabel = UILabel()
    
    // scrollView
    private var scrollView: UIScrollView = UIScrollView()
    
    // contentView
    private var contentView: UIView = UIView()
    
    private var descriptionLabel: UILabel = UILabel()
    
    // 데이터
    var bookTitle = ""
    var bookdescription = ""
    
    override func viewDidLoad() {
           super.viewDidLoad()

        setupNavigationBarLayout()
        setupContentViewLayout()
        setData()
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
        navigationBarView.addSubview(bookTitleLabel)
        bookTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                bookTitleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 20),
                bookTitleLabel.trailingAnchor.constraint(equalTo: navigationBarView.trailingAnchor, constant: -20),
                bookTitleLabel.centerYAnchor.constraint(equalTo: navigationBarView.centerYAnchor),
        ])

        bookTitleLabel.backgroundColor = .clear
        bookTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        bookTitleLabel.textColor = .white
        bookTitleLabel.textAlignment = .left
        bookTitleLabel.text = "이북 책 제목"
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
        
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
                descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
        
        descriptionLabel.backgroundColor = .clear
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        descriptionLabel.textColor = UIColor(named: "mainTextColor")
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트스크롤 테스트"
    }
    
    private func setData() {
        bookTitleLabel.text = bookTitle
        descriptionLabel.text = bookdescription
    }
    
    
    // action - back Button
    @objc func backButtonAction(sender: UIButton!) {
        self.dismissDetail()
    }
}
