//
//  DetailViewController.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/09.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // 네비게이션
    private var navigationBarView: UIView = UIView()
    private var backButton: UIButton = UIButton()
    private var shareButton: UIButton = UIButton()
    
    // scrollView
    private var scrollView: UIScrollView = UIScrollView()
    
    // contentView
    private var contentView: UIView = UIView()
    
    // book
    
    override func viewDidLoad() {
           super.viewDidLoad()

           setupNavigationBarLayout()
        
    }
    
    // 디테일화면 구성 - 상단 네비게이션 바/ 하단 컨테이너 뷰/ scrollview
    private func setupNavigationBarLayout() {
        
        // 메인 배경화면 컬러
        view.backgroundColor = UIColor(named: "mainBackgroundColor")
        
        // 네비게이션 뷰
        view.addSubview(navigationBarView)
        navigationBarView.translatesAutoresizingMaskIntoConstraints = false
        
        navigationBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        navigationBarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        navigationBarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        navigationBarView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        navigationBarView.backgroundColor = .clear
        
        // 이전 버튼
        navigationBarView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.topAnchor.constraint(equalTo: navigationBarView.topAnchor, constant: 0).isActive = true
        backButton.bottomAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: 0).isActive = true
        backButton.leadingAnchor.constraint(equalTo: navigationBarView.leadingAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        backButton.setImage(UIImage(named: "left_arrow.png"), for: .normal)
        backButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        backButton.backgroundColor = .clear
        
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
        // 공유 버튼
        navigationBarView.addSubview(shareButton)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        shareButton.topAnchor.constraint(equalTo: navigationBarView.topAnchor, constant: 0).isActive = true
        shareButton.bottomAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: 0).isActive = true
        shareButton.trailingAnchor.constraint(equalTo: navigationBarView.trailingAnchor).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        shareButton.setImage(UIImage(named: "share.png"), for: .normal)
        shareButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        shareButton.backgroundColor = .clear
        
        shareButton.addTarget(self, action: #selector(shareButtonAction), for: .touchUpInside)

        // 스크롤 뷰
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(named: "mainBackgroundColor")
        scrollView.showsVerticalScrollIndicator = true
        
        NSLayoutConstraint.activate([
                    scrollView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
                    scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        
        //contentView
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
                    contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                    contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                    contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                    contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
    }
    
    // action - back Button
    @objc func backButtonAction(sender: UIButton!) {
        self.dismissDetail()
    }
    
    // action - share Button
    @objc func shareButtonAction(sender: UIButton!) {
        
        let bookLink: String = "www.naver.com"
        var shareObject = [Any]()
        
        shareObject.append(bookLink)
        
        let activityViewController = UIActivityViewController(activityItems: shareObject, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view

        self.present(activityViewController, animated: true, completion: nil)
    }
    
}
