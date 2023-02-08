//
//  ViewController.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/08.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 네비게이션
    private var navigationBarView: UIView = UIView()
    private var backButton: UIButton = UIButton()
    private var searchField: UITextField = UITextField()
    
    // 메뉴 탭
    private var menuBarView: UIView = UIView()
    private var lineView: UIView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarLayout()
        setupMenuBarLayout()
    }

    // 메인화면 구성 - 상단 네비게이션 바
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
        backButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        backButton.backgroundColor = .clear
        
        // 검색 텍스트 필드
        navigationBarView.addSubview(searchField)
        searchField.translatesAutoresizingMaskIntoConstraints = false
        
        searchField.topAnchor.constraint(equalTo: navigationBarView.topAnchor, constant: 0).isActive = true
        searchField.bottomAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: 0).isActive = true
        searchField.leadingAnchor.constraint(equalTo: backButton.trailingAnchor).isActive = true
        searchField.trailingAnchor.constraint(equalTo: navigationBarView.trailingAnchor, constant: -10).isActive = true
        
        searchField.backgroundColor = .clear
        searchField.attributedPlaceholder = NSAttributedString(
            string: "Play 북에서 검색",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "mainTextColor")!]
        )
        searchField.clearButtonMode = .whileEditing
        searchField.textColor = UIColor(named: "mainTextColor")
    }
    
    // 메인화면 구성 - 메뉴 탭
    private func setupMenuBarLayout() {
        
        // 메뉴 바 뷰
        view.addSubview(menuBarView)
        menuBarView.translatesAutoresizingMaskIntoConstraints = false
        
        menuBarView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: 0).isActive = true
        menuBarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        menuBarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        menuBarView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        menuBarView.backgroundColor = .clear
        
        // 메뉴바 하단 라인
        menuBarView.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        lineView.bottomAnchor.constraint(equalTo: menuBarView.bottomAnchor, constant: 0).isActive = true
        lineView.leadingAnchor.constraint(equalTo: menuBarView.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: menuBarView.trailingAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.backgroundColor = .gray
        
    }
}
