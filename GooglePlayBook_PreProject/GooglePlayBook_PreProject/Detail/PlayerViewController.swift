//
//  PlayerViewController.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/13.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import UIKit
import WebKit

class PlayerViewController: UIViewController, WKUIDelegate {
    
    // 네비게이션
    private var navigationBarView: UIView = UIView()
    private var backButton: UIButton = UIButton()
    private var videoTitleLabel: UILabel = UILabel()
    
    // contentView
    private var contentView: UIView = UIView()
    private var videoWebView:WKWebView = WKWebView()
    
    // 데이터
    var videoTitle = ""
    var videoId = ""
    
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
        navigationBarView.addSubview(videoTitleLabel)
        videoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            videoTitleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 20),
            videoTitleLabel.trailingAnchor.constraint(equalTo: navigationBarView.trailingAnchor, constant: -20),
            videoTitleLabel.centerYAnchor.constraint(equalTo: navigationBarView.centerYAnchor),
        ])

        videoTitleLabel.backgroundColor = .clear
        videoTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        videoTitleLabel.textColor = .white
        videoTitleLabel.textAlignment = .left
        videoTitleLabel.text = "비디오 제목"
    }
    
    // ContentView - player
    private func setupContentViewLayout() {
        // content View
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        contentView.backgroundColor = .black

        NSLayoutConstraint.activate([
                contentView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
                contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
        ])
        
        // player
        videoWebView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(videoWebView)
        videoWebView.backgroundColor = .darkGray

        NSLayoutConstraint.activate([
            videoWebView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            videoWebView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 0),
            videoWebView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 0),
            videoWebView.heightAnchor.constraint(equalToConstant: 200),
        ])
        videoWebView.uiDelegate = self
        contentView.addSubview(videoWebView)
                
    }
    
    private func setData() {
        videoTitleLabel.text = videoTitle
        getVideo(videoKey: videoId)
    }
    func getVideo(videoKey:String){
            guard let url = URL(string: "https://www.youtube.com/embed/\(videoKey)") else { return  }
            let urlRequest:URLRequest = URLRequest(url: url)
            videoWebView.load(urlRequest)
    }
    
    // action - back Button
    @objc func backButtonAction(sender: UIButton!) {
        self.dismissDetail()
    }
}
