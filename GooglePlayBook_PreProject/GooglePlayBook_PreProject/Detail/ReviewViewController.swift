//
//  ReviewViewController.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/11.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    // 네비게이션
    private var navigationBarView: UIView = UIView()
    private var backButton: UIButton = UIButton()
    private var titleLabel: UILabel = UILabel()
    
    // scrollView
    private var scrollView: UIScrollView = UIScrollView()
    
    // contentView
    private var contentView: UIView = UIView()
    
    // leftLayoutView
    private var leftLayoutView: UIView = UIView()
    
    // ratingCountLabel
    private var ratingCountContentView: UIView = UIView()
    private var ratingCountLabel: UILabel = UILabel()
    // reviewCountLabel
    private var reviewCountLabel: UILabel = UILabel()
    
    // rightLayoutView
    private var rightLayoutView: UIView = UIView()
    
    // graph view
    lazy var oneGraphView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 3)
        ])
        return view
    }()
    lazy var twoGraphView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 3)
        ])
        return view
    }()
    lazy var threeGraphView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "pointBlueColor")
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 3)
        ])
        return view
    }()
    lazy var fourGraphView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 3)
        ])
        return view
    }()
    lazy var fiveGraphView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 3)
        ])
        return view
    }()
    
    // graphStackView
    lazy var graphStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [oneGraphView, twoGraphView, threeGraphView, fourGraphView,fiveGraphView])
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.alignment = .fill
            stackView.spacing = 10
            stackView.backgroundColor = .clear
            view.addSubview(stackView)

            NSLayoutConstraint.activate([
                stackView.heightAnchor.constraint(equalToConstant: 100)
            ])
        return stackView
    }()
    
    // count label
    lazy var oneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "1"
        return label
    }()
    lazy var twoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "2"
        return label
    }()
    lazy var threeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "3"
        return label
    }()
    lazy var fourLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "4"
        return label
    }()
    lazy var fiveLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "5"
        return label
    }()
    
    //countlabelStackView
    lazy var countLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fiveLabel,fourLabel,threeLabel,twoLabel,oneLabel])
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.alignment = .fill
            stackView.spacing = 10
            stackView.backgroundColor = .clear
            view.addSubview(stackView)

            NSLayoutConstraint.activate([
                stackView.heightAnchor.constraint(equalToConstant: 100)
            ])
            return stackView
    }()
    
    
    // star imageView stack
    lazy var one_starImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "star_blue")
        view.backgroundColor = .clear
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 20)
        ])
        return view
    }()
    lazy var two_starImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "star_blue")
        view.backgroundColor = .clear
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 20)
        ])
        return view
    }()
    lazy var three_starImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "star_blue")
        view.backgroundColor = .clear
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 20)
        ])
        return view
    }()
    lazy var four_starImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "star")
        view.backgroundColor = .clear
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 20)
        ])
        return view
    }()
    lazy var five_starImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "star")
        view.backgroundColor = .clear
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 20)
        ])
        return view
    }()
    
    lazy var starImageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [one_starImageView, two_starImageView, three_starImageView, four_starImageView,five_starImageView])
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.alignment = .fill
            stackView.backgroundColor = .clear
            view.addSubview(stackView)

            NSLayoutConstraint.activate([
                stackView.heightAnchor.constraint(equalToConstant: 20)
            ])
        return stackView
    }()
        
    override func viewDidLoad() {
           super.viewDidLoad()

           setupNavigationBarLayout()
           setupContentViewLayout()
        
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
        
        // leftLayoutView
        leftLayoutView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(leftLayoutView)
        leftLayoutView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            leftLayoutView.topAnchor.constraint(equalTo: contentView.topAnchor),
            leftLayoutView.heightAnchor.constraint(equalToConstant: 130),
            leftLayoutView.widthAnchor.constraint(equalToConstant: 140),
            leftLayoutView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
        ])
        
        // ratingCountView
        leftLayoutView.addSubview(ratingCountContentView)
        ratingCountContentView.translatesAutoresizingMaskIntoConstraints = false
        ratingCountContentView.backgroundColor = .clear
        NSLayoutConstraint.activate([
            ratingCountContentView.topAnchor.constraint(equalTo: leftLayoutView.topAnchor),
            ratingCountContentView.leadingAnchor.constraint(equalTo: leftLayoutView.leadingAnchor, constant: 0),
            ratingCountContentView.trailingAnchor.constraint(equalTo: leftLayoutView.trailingAnchor, constant: 0),
            ratingCountContentView.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        // ratingCountLabel
        ratingCountContentView.addSubview(ratingCountLabel)
        ratingCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ratingCountLabel.centerYAnchor.constraint(equalTo: ratingCountContentView.centerYAnchor),
            ratingCountLabel.centerXAnchor.constraint(equalTo: ratingCountContentView.centerXAnchor),
        ])

        ratingCountLabel.backgroundColor = .clear
        ratingCountLabel.font = UIFont.boldSystemFont(ofSize: 60)
        ratingCountLabel.textColor = .white
        ratingCountLabel.textAlignment = .center
        ratingCountLabel.text = "3.0"
        
        // starImageStackView
        starImageStackView.translatesAutoresizingMaskIntoConstraints = false
        leftLayoutView.addSubview(starImageStackView)

        NSLayoutConstraint.activate([
            starImageStackView.leadingAnchor.constraint(equalTo: leftLayoutView.leadingAnchor, constant: 20),
            starImageStackView.trailingAnchor.constraint(equalTo: leftLayoutView.trailingAnchor, constant: -20),
            starImageStackView.topAnchor.constraint(equalTo: ratingCountContentView.bottomAnchor),
        ])
        
        // reviewCountLabel
        leftLayoutView.addSubview(reviewCountLabel)
        reviewCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            reviewCountLabel.leadingAnchor.constraint(equalTo: leftLayoutView.leadingAnchor, constant: 0),
            reviewCountLabel.trailingAnchor.constraint(equalTo: leftLayoutView.trailingAnchor, constant: 0),
            reviewCountLabel.topAnchor.constraint(equalTo: starImageStackView.bottomAnchor, constant: 5),
        ])

        reviewCountLabel.backgroundColor = .clear
        reviewCountLabel.font = UIFont.systemFont(ofSize: 16)
        reviewCountLabel.textColor = UIColor(named: "mainTextColor")
        reviewCountLabel.textAlignment = .center
        reviewCountLabel.text = "평점 1개"
        
        
        // rightLayoutView
        rightLayoutView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(rightLayoutView)
        rightLayoutView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            rightLayoutView.topAnchor.constraint(equalTo: contentView.topAnchor),
            rightLayoutView.heightAnchor.constraint(equalToConstant: 130),
            rightLayoutView.leadingAnchor.constraint(equalTo: leftLayoutView.trailingAnchor, constant: 0),
            rightLayoutView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
        ])
        
        // countLabelStackView
        countLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        rightLayoutView.addSubview(countLabelStackView)

        NSLayoutConstraint.activate([
            countLabelStackView.leadingAnchor.constraint(equalTo: rightLayoutView.leadingAnchor, constant: 0),
            countLabelStackView.topAnchor.constraint(equalTo: rightLayoutView.topAnchor, constant: 10),
            countLabelStackView.bottomAnchor.constraint(equalTo: rightLayoutView.bottomAnchor, constant: -10),
        ])
        
        // graphStackView
        graphStackView.translatesAutoresizingMaskIntoConstraints = false
        rightLayoutView.addSubview(graphStackView)

        NSLayoutConstraint.activate([
            graphStackView.leadingAnchor.constraint(equalTo: countLabelStackView.trailingAnchor, constant: 10),
            graphStackView.trailingAnchor.constraint(equalTo: rightLayoutView.trailingAnchor, constant: -20),
            graphStackView.topAnchor.constraint(equalTo: rightLayoutView.topAnchor, constant: 10),
            graphStackView.bottomAnchor.constraint(equalTo: rightLayoutView.bottomAnchor, constant: -10),
        ])
        
    }
    
    // action - back Button
    @objc func backButtonAction(sender: UIButton!) {
        self.dismissDetail()
    }
}
