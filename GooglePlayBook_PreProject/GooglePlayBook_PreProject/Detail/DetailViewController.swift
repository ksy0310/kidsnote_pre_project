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
    private var ratingCountLabel: UILabel = UILabel()
    private var ratingCountInfoButton: UIButton = UIButton()
    
    // --- 스택뷰로 별 표시, 별 개수 별 그래프 표시 ---
    
    // publishedDateView
    private var publishedDateView: UIView = UIView()
    private var publishedDateTitleLabel: UILabel = UILabel()
    private var publishedDateLabel: UILabel = UILabel()
    private var publisherLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
           super.viewDidLoad()

           setupNavigationBarLayout()
           setupContentViewLayout()
        
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
        scrollView.showsVerticalScrollIndicator = true
        
        NSLayoutConstraint.activate([
                    scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
                    scrollView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
                    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        
        //contentView
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .clear
        
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
        
        wishListButton.setImage(UIImage(named: "bookmark.png")! as UIImage, for: .normal)
        wishListButton.imageView?.contentMode = .scaleAspectFit
        wishListButton.contentVerticalAlignment = .fill
        wishListButton.contentHorizontalAlignment = .fill
        wishListButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: -30, bottom: 10, right: 10)
        wishListButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -210, bottom: 0, right: 0)
        
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
            descriptionDetailImageView.widthAnchor.constraint(equalToConstant: 20),
            descriptionDetailImageView.heightAnchor.constraint(equalToConstant: 20),
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
        ratingCountView.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            
            ratingCountView.topAnchor.constraint(equalTo: bookdescriptionView.bottomAnchor),
            ratingCountView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ratingCountView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ratingCountView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        // 게시일
        contentView.addSubview(publishedDateView)
        publishedDateView.translatesAutoresizingMaskIntoConstraints = false
        publishedDateView.backgroundColor = .yellow
        
        NSLayoutConstraint.activate([
            
            publishedDateView.topAnchor.constraint(equalTo: ratingCountView.bottomAnchor),
            publishedDateView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            publishedDateView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            publishedDateView.heightAnchor.constraint(equalToConstant: 60),
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
    
    // action - bookdescription Button
    @objc func bookdescriptionButtonAction(sender: UIButton!) {
        print("bookdescriptionButtonAction click!!")
        let infoViewController: InfoViewController = InfoViewController()
        infoViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen

        self.presentDetail(infoViewController)
    }
}
