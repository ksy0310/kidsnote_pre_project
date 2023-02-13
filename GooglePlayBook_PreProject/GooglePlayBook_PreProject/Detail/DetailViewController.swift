//
//  DetailViewController.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/09.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // 데이터
    var ebookInfo:Book!
    var isEBook:Bool = true
    var videoInfo:Youtube!
    var videoId:String!
    
    // 네비게이션
    private var navigationBarView: UIView = UIView()
    private var backButton: UIButton = UIButton()
    private var shareButton: UIButton = UIButton()
    
    // scrollView
    private var scrollView: UIScrollView = UIScrollView()
    
    // contentView
    private var contentView: UIView = UIView()
    
    // bookInfoView
    private var bookInfoView: UIView = UIView()
    private var bookThumbnailImageView: UIImageView = UIImageView()
    private var bookTitleLabel: UILabel = UILabel()
    private var bookAuthorsLabel: UILabel = UILabel()
    private var bookKindLabel: UILabel = UILabel()
    private var bookPagesLabel: UILabel = UILabel()
    
    private var bookInfoLineView: UIView = UIView()
    
    // functionView
    private var functionView: UIView = UIView()
    private var sampleButton: UIButton = UIButton()
    private var wishListButton: UIButton = UIButton()
    var whishListFlag: Bool = false
    private var infoView: UIView = UIView()
    private var infoImageView: UIImageView = UIImageView()
    private var infoLabel: UILabel = UILabel()
    
    private var functionLineView: UIView = UIView()
    
    // bookdescriptionView
    private var bookdescriptionView: UIView = UIView()
    private var descriptionTitleLabel: UILabel = UILabel()
    private var descriptionDetailImageView: UIImageView = UIImageView()
    private var descriptionLabel: UILabel = UILabel()
    private var bookdescriptionButton: UIButton = UIButton()
    
    // ratingCountView
    private var ratingCountView: UIView = UIView()
    private var ratingCountTitleLabel: UILabel = UILabel()
    private var ratingCountDetailImageView: UIImageView = UIImageView()
    
    private var ratingCountButton: UIButton = UIButton()
    
    // -------
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
    
    // -------
    
    // ratingCountInfo
    private var ratingCountInfoView: UIView = UIView()
    private var ratingCountInfoLabel: UILabel = UILabel()
    private var ratingCountInfoImageView: UIImageView = UIImageView()
    private var ratingCountInfoButton: UIButton = UIButton()
    
    // publishedDateView
    private var publishedDateView: UIView = UIView()
    private var publishedDateTitleLabel: UILabel = UILabel()
    private var publishedDateLabel: UILabel = UILabel()
    private var publisherLabel: UILabel = UILabel()
    
    private var emptyLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
           super.viewDidLoad()

        setupNavigationBarLayout()
        setupContentViewLayout()
        
        setData()
        
    }
    
    // 디테일화면 구성 - 상단 네비게이션 바/ 하단 컨테이너 뷰/ scrollview
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
        
        // 공유 버튼
        navigationBarView.addSubview(shareButton)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(equalTo: navigationBarView.topAnchor, constant: 0),
            shareButton.bottomAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: 0),
            shareButton.trailingAnchor.constraint(equalTo: navigationBarView.trailingAnchor),
            shareButton.widthAnchor.constraint(equalToConstant: 44),
        ])
        
        shareButton.setImage(UIImage(named: "share.png"), for: .normal)
        shareButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        shareButton.backgroundColor = .clear
        
        shareButton.addTarget(self, action: #selector(shareButtonAction), for: .touchUpInside)

        // 스크롤 뷰
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(named: "mainBackgroundColor")
                
        NSLayoutConstraint.activate([
                    scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
                    scrollView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
                    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        //contentView
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor(named: "mainBackgroundColor")
        
        NSLayoutConstraint.activate([
                    contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                    contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                    contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    
    }
    
    // 디테일화면 구성 - bookInfoView
    private func setupContentViewLayout() {
        
        // 1. 책 정보
        contentView.addSubview(bookInfoView)
        
        bookInfoView.translatesAutoresizingMaskIntoConstraints = false
        bookInfoView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
                    bookInfoView.topAnchor.constraint(equalTo: contentView.topAnchor),
                    bookInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    bookInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                    bookInfoView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        // book Thumbnail
        bookInfoView.addSubview(bookThumbnailImageView)
        bookThumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
                    bookThumbnailImageView.centerYAnchor.constraint(equalTo: bookInfoView.centerYAnchor),
                    bookThumbnailImageView.topAnchor.constraint(equalTo: bookInfoView.topAnchor, constant: 20),
                    bookThumbnailImageView.bottomAnchor.constraint(equalTo: bookInfoView.bottomAnchor, constant: -20),
                    bookThumbnailImageView.leadingAnchor.constraint(equalTo: bookInfoView.leadingAnchor, constant: 20),
                    bookThumbnailImageView.widthAnchor.constraint(equalToConstant: 100),
                    
        ])
        
        bookThumbnailImageView.image = UIImage(named: "noimage")
        bookThumbnailImageView.backgroundColor = .white
        bookThumbnailImageView.clipsToBounds = true
        bookThumbnailImageView.layer.cornerRadius = 10
        
        // book Title
        bookInfoView.addSubview(bookTitleLabel)
        bookTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                bookTitleLabel.leadingAnchor.constraint(equalTo: bookThumbnailImageView.trailingAnchor, constant: 20),
                bookTitleLabel.trailingAnchor.constraint(equalTo: bookInfoView.trailingAnchor, constant: -20),
                bookTitleLabel.topAnchor.constraint(equalTo: bookThumbnailImageView.topAnchor, constant: 0),
        ])

        bookTitleLabel.backgroundColor = .clear
        bookTitleLabel.font = UIFont.boldSystemFont(ofSize: 26)
        bookTitleLabel.textColor = .white
        bookTitleLabel.textAlignment = .left
        bookTitleLabel.numberOfLines = 2
        bookTitleLabel.text = "이북 책 제목"
        
        // book Authors
        bookInfoView.addSubview(bookAuthorsLabel)
        bookAuthorsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                bookAuthorsLabel.leadingAnchor.constraint(equalTo: bookThumbnailImageView.trailingAnchor, constant: 20),
                bookAuthorsLabel.trailingAnchor.constraint(equalTo: bookInfoView.trailingAnchor, constant: -20),
                bookAuthorsLabel.topAnchor.constraint(equalTo: bookTitleLabel.bottomAnchor, constant: 5),
        ])

        bookAuthorsLabel.backgroundColor = .clear
        bookAuthorsLabel.font = UIFont.systemFont(ofSize: 16)
        bookAuthorsLabel.textColor = UIColor(named: "mainTextColor")
        bookAuthorsLabel.textAlignment = .left
        bookAuthorsLabel.numberOfLines = 2
        bookAuthorsLabel.text = "이북 책 작가"
        
        // book Kind
        bookInfoView.addSubview(bookKindLabel)
        bookKindLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
                bookKindLabel.leadingAnchor.constraint(equalTo: bookThumbnailImageView.trailingAnchor, constant: 20),
                bookKindLabel.topAnchor.constraint(equalTo: bookAuthorsLabel.bottomAnchor, constant: 3),
        ])
        
        bookKindLabel.backgroundColor = .clear
        bookKindLabel.font = UIFont.systemFont(ofSize: 16)
        bookKindLabel.textColor = UIColor(named: "mainTextColor")
        bookKindLabel.textAlignment = .left
        bookKindLabel.text = "eBook ·"
        
        // book Pages
        bookInfoView.addSubview(bookPagesLabel)
        bookPagesLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
                bookPagesLabel.leadingAnchor.constraint(equalTo: bookKindLabel.trailingAnchor, constant: 5),
                bookPagesLabel.topAnchor.constraint(equalTo: bookAuthorsLabel.bottomAnchor, constant: 3),
        ])
        
        bookPagesLabel.backgroundColor = .clear
        bookPagesLabel.font = UIFont.systemFont(ofSize: 16)
        bookPagesLabel.textColor = UIColor(named: "mainTextColor")
        bookPagesLabel.textAlignment = .left
        bookPagesLabel.text = "240페이지"
        
        // 책 정보 뷰 하단 라인
        bookInfoView.addSubview(bookInfoLineView)
        bookInfoLineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bookInfoLineView.bottomAnchor.constraint(equalTo: bookInfoView.bottomAnchor, constant: 0),
            bookInfoLineView.leadingAnchor.constraint(equalTo: bookInfoView.leadingAnchor),
            bookInfoLineView.trailingAnchor.constraint(equalTo: bookInfoView.trailingAnchor),
            bookInfoLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        bookInfoLineView.backgroundColor = .gray
        
        
        // 2.버튼 뷰
        contentView.addSubview(functionView)
        
        functionView.translatesAutoresizingMaskIntoConstraints = false
        functionView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
                    functionView.topAnchor.constraint(equalTo: bookInfoView.bottomAnchor, constant: 0),
                    functionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    functionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                    functionView.heightAnchor.constraint(equalToConstant: 130),
        ])
        
        // sample Button
        functionView.addSubview(sampleButton)
        
        sampleButton.translatesAutoresizingMaskIntoConstraints = false
        sampleButton.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
                    sampleButton.topAnchor.constraint(equalTo: functionView.topAnchor, constant: 20),
                    sampleButton.leadingAnchor.constraint(equalTo: functionView.leadingAnchor, constant: 20),
                    sampleButton.heightAnchor.constraint(equalToConstant: 40),
                    sampleButton.widthAnchor.constraint(equalToConstant: 140),
                    
        ])
        
        sampleButton.setTitle("샘플 읽기",for:.normal)
        sampleButton.setTitleColor(UIColor(named: "pointBlueColor"), for: .normal)
        sampleButton.layer.cornerRadius = 5
        sampleButton.layer.borderWidth = 1
        sampleButton.layer.borderColor = UIColor.gray.cgColor
        sampleButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        sampleButton.addTarget(self, action: #selector(sampleButtonAction), for: .touchUpInside)
        
        // wishList Button
        functionView.addSubview(wishListButton)
        
        wishListButton.translatesAutoresizingMaskIntoConstraints = false
        wishListButton.backgroundColor = UIColor(named: "pointBlueColor")
        
        NSLayoutConstraint.activate([
                    wishListButton.topAnchor.constraint(equalTo: functionView.topAnchor, constant: 20),
                    wishListButton.leadingAnchor.constraint(equalTo: sampleButton.trailingAnchor, constant: 10),
                    wishListButton.trailingAnchor.constraint(equalTo: functionView.trailingAnchor, constant: -20),
                    wishListButton.heightAnchor.constraint(equalTo: sampleButton.heightAnchor),
        ])
        
        wishListButton.setTitle("위시리스트에 추가",for:.normal)
        wishListButton.setTitleColor(UIColor(named: "mainBackgroundColor"), for: .normal)
        
        wishListButton.layer.cornerRadius = 5
        wishListButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        wishListButton.setImage(UIImage(named: "add_bookmark.png")! as UIImage, for: .normal)
        wishListButton.imageView?.contentMode = .scaleAspectFit
        wishListButton.contentVerticalAlignment = .fill
        wishListButton.contentHorizontalAlignment = .fill
        wishListButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: -30, bottom: 10, right: 10)
        wishListButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -210, bottom: 0, right: 0)
        
        whishListFlag = false
        
        wishListButton.addTarget(self, action: #selector(wishListButtonAction), for: .touchUpInside)
        
        // infoView
        functionView.addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: sampleButton.bottomAnchor, constant: 10),
            infoView.bottomAnchor.constraint(equalTo: functionView.bottomAnchor, constant: 0),
            infoView.leadingAnchor.constraint(equalTo: functionView.leadingAnchor, constant: 0),
            infoView.trailingAnchor.constraint(equalTo: functionView.trailingAnchor, constant: 0),
            infoView.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        // info Image
        infoView.addSubview(infoImageView)

        infoImageView.translatesAutoresizingMaskIntoConstraints = false
        infoImageView.backgroundColor = .clear

        NSLayoutConstraint.activate([
                    infoImageView.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 0),
                    infoImageView.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 0),
                    infoImageView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20),
                    infoImageView.heightAnchor.constraint(equalToConstant: 20),
                    infoImageView.widthAnchor.constraint(equalToConstant: 20),
        ])
        infoImageView.image = UIImage(named: "information")
        infoImageView.contentMode = .scaleAspectFit
        
        // info Label
        infoView.addSubview(infoLabel)

        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.backgroundColor = .clear

        NSLayoutConstraint.activate([
                    
                    infoLabel.centerYAnchor.constraint(equalTo: infoView.centerYAnchor),
                    infoLabel.leadingAnchor.constraint(equalTo: infoImageView.trailingAnchor, constant: 10),
                    infoLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -20),
                    
        ])
        infoLabel.text = "Google Play 웹사이트에서 구매한 책을 이 앱에서 읽을 수 있습니다."
        infoLabel.font = UIFont.systemFont(ofSize: 12)
        infoLabel.textColor = UIColor(named: "mainTextColor")
        infoLabel.numberOfLines = 2
        infoLabel.textAlignment = .left
        
        // 기능 뷰 하단 라인
        infoView.addSubview(functionLineView)
        functionLineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            functionLineView.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 0),
            functionLineView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor),
            functionLineView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor),
            functionLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        functionLineView.backgroundColor = .gray
        
        // 북 정보
        contentView.addSubview(bookdescriptionView)
        bookdescriptionView.translatesAutoresizingMaskIntoConstraints = false
        bookdescriptionView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            
            bookdescriptionView.topAnchor.constraint(equalTo: functionView.bottomAnchor),
            bookdescriptionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bookdescriptionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bookdescriptionView.heightAnchor.constraint(equalToConstant: 180),
        ])
        
        // descriptionTitle
        bookdescriptionView.addSubview(descriptionTitleLabel)
        descriptionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                descriptionTitleLabel.topAnchor.constraint(equalTo: bookdescriptionView.topAnchor, constant: 20),
                descriptionTitleLabel.leadingAnchor.constraint(equalTo: bookdescriptionView.leadingAnchor, constant: 20),
                descriptionTitleLabel.trailingAnchor.constraint(equalTo: bookdescriptionView.trailingAnchor, constant: -20),
                
        ])
        descriptionTitleLabel.backgroundColor = .clear
        descriptionTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        descriptionTitleLabel.textColor = .white
        descriptionTitleLabel.textAlignment = .left
        descriptionTitleLabel.text = "eBook 정보"
        
        // descriptionDetail image
        bookdescriptionView.addSubview(descriptionDetailImageView)
        descriptionDetailImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionDetailImageView.topAnchor.constraint(equalTo: bookdescriptionView.topAnchor, constant: 20),
            descriptionDetailImageView.trailingAnchor.constraint(equalTo: bookdescriptionView.trailingAnchor, constant: -20),
            descriptionDetailImageView.widthAnchor.constraint(equalToConstant: 18),
            descriptionDetailImageView.heightAnchor.constraint(equalToConstant: 18),
        ])
        
        descriptionDetailImageView.image = UIImage(named: "right_arrow")
        descriptionDetailImageView.backgroundColor = .clear
        
        // description Label
        bookdescriptionView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                descriptionLabel.topAnchor.constraint(equalTo: descriptionDetailImageView.bottomAnchor, constant: 10),
                descriptionLabel.leadingAnchor.constraint(equalTo: bookdescriptionView.leadingAnchor, constant: 20),
                descriptionLabel.trailingAnchor.constraint(equalTo: bookdescriptionView.trailingAnchor, constant: -20),
                descriptionLabel.bottomAnchor.constraint(equalTo: bookdescriptionView.bottomAnchor, constant: -20),
        ])
        descriptionLabel.backgroundColor = .clear
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textColor = UIColor(named: "mainTextColor")
        descriptionLabel.text = "책 소개, 책 설명, 책책책책 소개, 책 설명, 책책책책 소개, 책 설명, 책책책책 소개, 책 설명, 책책책책 소개, 책 설명, 책책책책 소개, 책 설명, 책책책책 소개, 책 설명, 책책책책 소개, 책 설명, 책책책책 소개, 책 설명, 책책책책 소개, 책 설명, 책책책책 소개, 책 설명, 책책책"
        
        // bookdescription 전체를 버튼으로
        bookdescriptionView.addSubview(bookdescriptionButton)
        bookdescriptionButton.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
                 bookdescriptionButton.topAnchor.constraint(equalTo: bookdescriptionView.topAnchor, constant: 0),
                 bookdescriptionButton.leadingAnchor.constraint(equalTo: bookdescriptionView.leadingAnchor, constant: 0),
                 bookdescriptionButton.trailingAnchor.constraint(equalTo: bookdescriptionView.trailingAnchor, constant: 0),
                 bookdescriptionButton.bottomAnchor.constraint(equalTo: bookdescriptionView.bottomAnchor, constant: 0),
         ])
        bookdescriptionButton.backgroundColor = .clear
        bookdescriptionButton.setTitle("",for:.normal)

        bookdescriptionButton.addTarget(self, action: #selector(bookdescriptionButtonAction), for: .touchUpInside)
        
        // 평점 및 리뷰
        contentView.addSubview(ratingCountView)
        ratingCountView.translatesAutoresizingMaskIntoConstraints = false
        ratingCountView.backgroundColor = .clear

        NSLayoutConstraint.activate([

            ratingCountView.topAnchor.constraint(equalTo: bookdescriptionView.bottomAnchor),
            ratingCountView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ratingCountView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ratingCountView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        // ratingCountTitle
        ratingCountView.addSubview(ratingCountTitleLabel)
        ratingCountTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                ratingCountTitleLabel.topAnchor.constraint(equalTo: ratingCountView.topAnchor, constant: 20),
                ratingCountTitleLabel.leadingAnchor.constraint(equalTo: ratingCountView.leadingAnchor, constant: 20),
                ratingCountTitleLabel.trailingAnchor.constraint(equalTo: ratingCountView.trailingAnchor, constant: -20),
                
        ])
        ratingCountTitleLabel.backgroundColor = .clear
        ratingCountTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        ratingCountTitleLabel.textColor = .white
        ratingCountTitleLabel.textAlignment = .left
        ratingCountTitleLabel.text = "평점 및 리뷰"
        
        // ratingCountDetailImage
        ratingCountView.addSubview(ratingCountDetailImageView)
        ratingCountDetailImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ratingCountDetailImageView.topAnchor.constraint(equalTo: ratingCountView.topAnchor, constant: 20),
            ratingCountDetailImageView.trailingAnchor.constraint(equalTo: ratingCountView.trailingAnchor, constant: -20),
            ratingCountDetailImageView.widthAnchor.constraint(equalToConstant: 18),
            ratingCountDetailImageView.heightAnchor.constraint(equalToConstant: 18),
        ])
        
        ratingCountDetailImageView.image = UIImage(named: "right_arrow")
        ratingCountDetailImageView.backgroundColor = .clear
        
        //  ------------------------
        // leftLayoutView
        leftLayoutView.translatesAutoresizingMaskIntoConstraints = false
        ratingCountView.addSubview(leftLayoutView)
        leftLayoutView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            leftLayoutView.topAnchor.constraint(equalTo: ratingCountTitleLabel.bottomAnchor, constant: 10),
            leftLayoutView.heightAnchor.constraint(equalToConstant: 130),
            leftLayoutView.widthAnchor.constraint(equalToConstant: 140),
            leftLayoutView.leadingAnchor.constraint(equalTo: ratingCountView.leadingAnchor, constant: 0),
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
        ratingCountView.addSubview(rightLayoutView)
        rightLayoutView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            rightLayoutView.topAnchor.constraint(equalTo: ratingCountTitleLabel.bottomAnchor, constant: 10),
            rightLayoutView.heightAnchor.constraint(equalToConstant: 130),
            rightLayoutView.leadingAnchor.constraint(equalTo: leftLayoutView.trailingAnchor, constant: 0),
            rightLayoutView.trailingAnchor.constraint(equalTo: ratingCountView.trailingAnchor, constant: 0),
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
        
        
        //  ------------------------
        
        // 평점 및 리뷰 뷰 전체를 버튼으로
        ratingCountView.addSubview(ratingCountButton)
        ratingCountButton.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
            ratingCountButton.topAnchor.constraint(equalTo: ratingCountView.topAnchor, constant: 0),
            ratingCountButton.leadingAnchor.constraint(equalTo: ratingCountView.leadingAnchor, constant: 0),
            ratingCountButton.trailingAnchor.constraint(equalTo: ratingCountView.trailingAnchor, constant: 0),
            ratingCountButton.bottomAnchor.constraint(equalTo: ratingCountView.bottomAnchor, constant: 0),
         ])
        ratingCountButton.backgroundColor = .clear
        ratingCountButton.setTitle("",for:.normal)

        ratingCountButton.addTarget(self, action: #selector(ratingCountButtonAction), for: .touchUpInside)
        
        // 평점 및 리뷰 정보
        contentView.addSubview(ratingCountInfoView)
        ratingCountInfoView.translatesAutoresizingMaskIntoConstraints = false
        ratingCountInfoView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            ratingCountInfoView.topAnchor.constraint(equalTo: ratingCountView.bottomAnchor),
            ratingCountInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ratingCountInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ratingCountInfoView.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        // ratingCountInfoLabel
        ratingCountInfoView.addSubview(ratingCountInfoLabel)
        ratingCountInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingCountInfoLabel.centerYAnchor.constraint(equalTo: ratingCountInfoView.centerYAnchor),
            ratingCountInfoLabel.leadingAnchor.constraint(equalTo: ratingCountInfoView.leadingAnchor, constant: 20),
        ])
        ratingCountInfoLabel.backgroundColor = .clear
        ratingCountInfoLabel.font = UIFont.systemFont(ofSize: 14)
        ratingCountInfoLabel.textColor = .white
        ratingCountInfoLabel.text = "평점 및 리뷰 정보"
        
        //ratingCountInfoImageView
        ratingCountInfoView.addSubview(ratingCountInfoImageView)
        ratingCountInfoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ratingCountInfoImageView.centerYAnchor.constraint(equalTo: ratingCountInfoView.centerYAnchor),
            ratingCountInfoImageView.leadingAnchor.constraint(equalTo: ratingCountInfoLabel.trailingAnchor, constant: 5),
            ratingCountInfoImageView.widthAnchor.constraint(equalToConstant: 12),
            ratingCountInfoImageView.heightAnchor.constraint(equalToConstant: 12),
        ])
        
        ratingCountInfoImageView.image = UIImage(named: "information_white")
        ratingCountInfoImageView.backgroundColor = .clear
        
        // 평점 및 리뷰 정보 뷰 전체를 버튼으로
        // ratingCountInfoButton
        ratingCountInfoView.addSubview(ratingCountInfoButton)
        ratingCountInfoButton.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
            ratingCountInfoButton.topAnchor.constraint(equalTo: ratingCountInfoView.topAnchor, constant: 0),
            ratingCountInfoButton.leadingAnchor.constraint(equalTo: ratingCountInfoView.leadingAnchor, constant: 0),
            ratingCountInfoButton.trailingAnchor.constraint(equalTo: ratingCountInfoView.trailingAnchor, constant: 0),
            ratingCountInfoButton.bottomAnchor.constraint(equalTo: ratingCountInfoView.bottomAnchor, constant: 0),
         ])
        ratingCountInfoButton.backgroundColor = .clear
        ratingCountInfoButton.setTitle("",for:.normal)

        ratingCountInfoButton.addTarget(self, action: #selector(ratingCountInfoButtonAction), for: .touchUpInside)
        
        
        
        // 게시일
        contentView.addSubview(publishedDateView)
        publishedDateView.translatesAutoresizingMaskIntoConstraints = false
        publishedDateView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            
            publishedDateView.topAnchor.constraint(equalTo: ratingCountInfoView.bottomAnchor, constant: 10),
            publishedDateView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            publishedDateView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            publishedDateView.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        // publishedDateTitle
        publishedDateView.addSubview(publishedDateTitleLabel)
        publishedDateTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                publishedDateTitleLabel.topAnchor.constraint(equalTo: publishedDateView.topAnchor, constant: 10),
                publishedDateTitleLabel.leadingAnchor.constraint(equalTo: publishedDateView.leadingAnchor, constant: 20),
                publishedDateTitleLabel.trailingAnchor.constraint(equalTo: publishedDateView.trailingAnchor, constant: -20),
                
        ])
        publishedDateTitleLabel.backgroundColor = .clear
        publishedDateTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        publishedDateTitleLabel.textColor = .white
        publishedDateTitleLabel.textAlignment = .left
        publishedDateTitleLabel.text = "게시일"
        
        // publishedDate
        publishedDateView.addSubview(publishedDateLabel)
        publishedDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                publishedDateLabel.topAnchor.constraint(equalTo: publishedDateTitleLabel.bottomAnchor, constant: 10),
                publishedDateLabel.leadingAnchor.constraint(equalTo: publishedDateView.leadingAnchor, constant: 20),
                publishedDateLabel.bottomAnchor.constraint(equalTo: publishedDateView.bottomAnchor, constant: -20),
        ])
        publishedDateLabel.backgroundColor = .clear
        publishedDateLabel.font = UIFont.systemFont(ofSize: 14)
        publishedDateLabel.textColor = UIColor(named: "mainTextColor")
        publishedDateLabel.text = "2013년 3월 21일 ·"
        
        // publisher
        publishedDateView.addSubview(publisherLabel)
        publisherLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                publisherLabel.topAnchor.constraint(equalTo: publishedDateLabel.topAnchor, constant: 0),
                publisherLabel.leadingAnchor.constraint(equalTo: publishedDateLabel.trailingAnchor, constant: 5),
                publisherLabel.trailingAnchor.constraint(equalTo: publishedDateView.trailingAnchor, constant: -20),
                publisherLabel.bottomAnchor.constraint(equalTo: publishedDateView.bottomAnchor, constant: -20),
        ])
        publisherLabel.backgroundColor = .clear
        publisherLabel.font = UIFont.systemFont(ofSize: 14)
        publisherLabel.textColor = UIColor(named: "mainTextColor")
        publisherLabel.text = "아라크네"
        
        // bottom empty label
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(emptyLabel)
        
        NSLayoutConstraint.activate([
            emptyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            emptyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            emptyLabel.topAnchor.constraint(equalTo: publishedDateView.bottomAnchor, constant: 20),
            emptyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
        
        emptyLabel.backgroundColor = .clear
        emptyLabel.font = UIFont.boldSystemFont(ofSize: 16)
        emptyLabel.textColor = UIColor(named: "mainTextColor")
        emptyLabel.textAlignment = .left
        emptyLabel.numberOfLines = 0
        emptyLabel.text = ""
        
        
    }
    
    // 데이터
    private func setData() {
        if isEBook {
            let authors = ebookInfo.volumeInfo.authors ?? ["..."]
            var author = ""
            
            for j in authors {
                author += "\(j) "
            }
            bookAuthorsLabel.text = author
            
            
            let thumbnailImg = ebookInfo.volumeInfo.imageLinks?.thumbnail
            let smallImg = ebookInfo.volumeInfo.imageLinks?.smallThumbnail
            if thumbnailImg != nil {
                bookThumbnailImageView.load(urlString: thumbnailImg!)
                bookThumbnailImageView.contentMode = .scaleAspectFill
            }else {
                if smallImg != nil {
                    bookThumbnailImageView.load(urlString: smallImg!)
                    bookThumbnailImageView.contentMode = .scaleAspectFill
                }else{
                    bookThumbnailImageView.image = UIImage(named: "noimage")
                }
            }
            bookTitleLabel.text = ebookInfo.volumeInfo.title
            
            bookKindLabel.text = "eBook ·"
            bookPagesLabel.text = String(Int(ebookInfo.volumeInfo.pageCount ?? 0)) + "페이지"
            
            descriptionLabel.text = ebookInfo.volumeInfo.description
            
            if ebookInfo.volumeInfo.averageRating != nil {
                ratingCountView.isHidden = false
                ratingCountInfoView.isHidden = false
                ratingCountLabel.text = String(ebookInfo.volumeInfo.averageRating!)
                reviewCountLabel.text = "평점 " + String(Int(ebookInfo.volumeInfo.ratingsCount!)) + "개"
                
            } else {
                publishedDateView.topAnchor.constraint(equalTo: bookdescriptionView.bottomAnchor, constant: 10).isActive = true
                ratingCountInfoView.isHidden = true
                ratingCountView.isHidden = true
            }
            
            if ebookInfo.volumeInfo.publishedDate != nil {
                let date = ebookInfo.volumeInfo.publishedDate
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd" // 2020-08-13
                        
                let convertDate = dateFormatter.date(from: date!) // Date 타입으로 변환
                
                let myDateFormatter = DateFormatter()
                myDateFormatter.dateFormat = "yyyy년MM월dd일"
                let convertStr = myDateFormatter.string(from: convertDate!)
                publishedDateLabel.text = convertStr + " ·"
            }
            publisherLabel.text = ebookInfo.volumeInfo.publisher
        } else {
            shareButton.isHidden = true
            wishListButton.isHidden = true
            sampleButton.setTitle("유투브 보기", for: .normal)
            sampleButton.trailingAnchor.constraint(equalTo: functionView.trailingAnchor, constant: -20).isActive = true
            
            bookAuthorsLabel.text = videoInfo.snippet.channelTitle
            let thumbnailImg = videoInfo.snippet.thumbnails?.medium?.url
            let highlImg = videoInfo.snippet.thumbnails?.high?.url
            bookThumbnailImageView.contentMode = .scaleAspectFill
            
            if thumbnailImg != nil {
                bookThumbnailImageView.load(urlString: thumbnailImg!)
            }else {
                if highlImg != nil {
                    bookThumbnailImageView.load(urlString: highlImg!)
                }else{
                    bookThumbnailImageView.image = UIImage(named: "noimage")
                }
            }
            bookTitleLabel.text = videoInfo.snippet.title
            
            bookKindLabel.text = "YouTube"
            bookPagesLabel.isHidden = true
            
            descriptionLabel.text = videoInfo.snippet.description
            
            publishedDateView.topAnchor.constraint(equalTo: bookdescriptionView.bottomAnchor, constant: 10).isActive = true
            ratingCountInfoView.isHidden = true
            ratingCountView.isHidden = true
            
            if videoInfo.snippet.publishedAt != nil {
                let date = String(videoInfo.snippet.publishedAt!)
                let startIndex = date.index(date.startIndex, offsetBy: 0)// 사용자지정 시작인덱스
                let endIndex = date.index(date.startIndex, offsetBy: 10)// 사용자지정 끝인덱스
                let sliced_str = date[startIndex ..< endIndex]
                print(sliced_str)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"

                let convertDate = dateFormatter.date(from: String(sliced_str)) // Date 타입으로 변환

                let myDateFormatter = DateFormatter()
                myDateFormatter.dateFormat = "yyyy년MM월dd일"
                let convertStr = myDateFormatter.string(from: convertDate!)
                publishedDateLabel.text = convertStr
            }
            publisherLabel.isHidden = true
            
        }
    }
    
    
    // action - back Button
    @objc func backButtonAction(sender: UIButton!) {
        self.dismissDetail()
    }
    
    // action - share Button
    @objc func shareButtonAction(sender: UIButton!) {
        if isEBook {
            let bookLink: String = ebookInfo.volumeInfo.infoLink!
            var shareObject = [Any]()

            shareObject.append(bookLink)

            let activityViewController = UIActivityViewController(activityItems: shareObject, applicationActivities: nil)
                    activityViewController.popoverPresentationController?.sourceView = self.view

            self.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    // action - sample Button
    @objc func sampleButtonAction(sender: UIButton!) {
        if isEBook {
            print("sampleButtonAction click!!")
            let bookLink: String = ebookInfo.volumeInfo.previewLink!
            if let url = URL(string: bookLink) {
                UIApplication.shared.open(url, options: [:])
            }
        } else {
            print("youtubeAction click!!")
            let youtubeLink: String = "https://www.youtube.com/watch?v="+videoId
            if let url = URL(string: youtubeLink) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
    // action - wishList Button
    @objc func wishListButtonAction(sender: UIButton!) {
        print("wishListButtonAction click!!")
        
        if whishListFlag {
            //False로
            wishListButton.setImage(UIImage(named: "delete_bookmark.png")! as UIImage, for: .normal)
            wishListButton.setTitle("위시리스트에서 삭제",for:.normal)
            whishListFlag = false
        }else{
            //True로
            wishListButton.setImage(UIImage(named: "add_bookmark.png")! as UIImage, for: .normal)
            wishListButton.setTitle("위시리스트에 추가",for:.normal)
            whishListFlag = true
        }
    }
    
    // action - bookdescription Button
    @objc func bookdescriptionButtonAction(sender: UIButton!) {
        print("bookdescriptionButtonAction click!!")
        let infoViewController: InfoViewController = InfoViewController()
        infoViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        if isEBook {
            infoViewController.bookTitle = ebookInfo.volumeInfo.title
            infoViewController.bookdescription = ebookInfo.volumeInfo.description!
        } else {
            infoViewController.bookTitle = videoInfo.snippet.channelTitle!
            infoViewController.bookdescription = videoInfo.snippet.description!
        }
        self.presentDetail(infoViewController)
    }
    
    
    // action - ratingCount Button
    @objc func ratingCountButtonAction(sender: UIButton!) {
        print("ratingCountButtonAction click!!")
        let reviewViewController: ReviewViewController = ReviewViewController()
        reviewViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        reviewViewController.ratingCount = String(ebookInfo.volumeInfo.averageRating!)
        reviewViewController.reviewCount = String(Int(ebookInfo.volumeInfo.ratingsCount!))
        self.presentDetail(reviewViewController)
    }
    
    // action - ratingCountInfoButton
    @objc func ratingCountInfoButtonAction(sender: UIButton!) {
        print("ratingCountInfoButtonAction click!!")
        
        let actionsheetController = UIAlertController(title: "평점 및 리뷰 정보", message: "평점은 지역 내 사용자의 최근 평점을 토대로 합니다.", preferredStyle: .actionSheet)
        
        let detailAction = UIAlertAction(title: "자세히 알아보기", style: .default) { (action) in
            if let url = URL(string: "https://play.google.com/about/comment-posting-policy/") {
                UIApplication.shared.open(url, options: [:])
            }

        }
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
        }

        actionsheetController.addAction(detailAction)
        actionsheetController.addAction(okAction)
        present(actionsheetController, animated: true, completion: nil)
    }
    
    
}
