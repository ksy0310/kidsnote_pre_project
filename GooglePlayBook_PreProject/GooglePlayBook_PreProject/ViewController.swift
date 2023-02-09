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
    let menuBarCollectionView:  UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // 메뉴 탭 데이터
    private let menudata = MenuBarCollectionViewData.menuList

    // containerView
    private var containerView: UIView = UIView()
    
    let eBookCollectionView:  UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarLayout()
        setupMenuBarLayout()
        setupMenuBarCollectionViewLayout()
        configureCollectionView()
        setFirstIndexIsSelected()
        setupcontainerViewLayout()
        setupeBookCollectionViewLayout()
        
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
        backButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
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
    
    // 메인화면 구성 - 하단 컨테이너 뷰
    private func setupcontainerViewLayout() {
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.topAnchor.constraint(equalTo: menuBarView.bottomAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        containerView.backgroundColor = .clear
    }
}

// collectionView
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 메뉴 바 - 0번째 Index로
    func setFirstIndexIsSelected() {
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        menuBarCollectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .bottom)
    }
    
    func configureCollectionView() {
        // 메뉴 바 collectionview
        menuBarCollectionView.register(MenuBarCollectionViewCell.self, forCellWithReuseIdentifier: MenuBarCollectionViewCell.id)
        menuBarCollectionView.delegate = self
        menuBarCollectionView.dataSource = self
        
        // eBook collectionView
        eBookCollectionView.register(EBookCollectionViewCell.self, forCellWithReuseIdentifier: EBookCollectionViewCell.id)
        eBookCollectionView.delegate = self
        eBookCollectionView.dataSource = self
        
        // headerview
        eBookCollectionView.register(EBookCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: EBookCollectionReusableView.id)
        
    }
    
    // 메뉴 바 collectionview layout
    func setupMenuBarCollectionViewLayout() {
        menuBarView.addSubview(menuBarCollectionView)

        menuBarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        menuBarCollectionView.topAnchor.constraint(equalTo: menuBarView.topAnchor, constant: 0).isActive = true
        menuBarCollectionView.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: 0).isActive = true
        menuBarCollectionView.leadingAnchor.constraint(equalTo: menuBarView.leadingAnchor).isActive = true
        menuBarCollectionView.trailingAnchor.constraint(equalTo: menuBarView.trailingAnchor).isActive = true
        
    }
    
    // eBook collectionview layout
    func setupeBookCollectionViewLayout() {
        containerView.addSubview(eBookCollectionView)

        eBookCollectionView.translatesAutoresizingMaskIntoConstraints = false
        eBookCollectionView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        eBookCollectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        eBookCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        eBookCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
    }
    
    // collectionView cell count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == menuBarCollectionView){
            return menudata.count
        }else{
            return 30
        }
    }
    
    // collectionView cell UI
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == menuBarCollectionView){
            let cell = menuBarCollectionView.dequeueReusableCell(withReuseIdentifier: MenuBarCollectionViewCell.id, for: indexPath) as! MenuBarCollectionViewCell
        
            cell.menuTitle.text = menudata[indexPath.item]
        
            return cell
        }else{
            let cell = eBookCollectionView.dequeueReusableCell(withReuseIdentifier: EBookCollectionViewCell.id, for: indexPath) as! EBookCollectionViewCell
            
                return cell
        }
    }
    
    // collectionView cell size
    // UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == menuBarCollectionView){
             let width = view.bounds.width / CGFloat(menudata.count)
             let height = collectionView.bounds.height
             return CGSize(width: width, height: height)
        }else{
            let width = collectionView.bounds.width
            let height = collectionView.bounds.height / 6
            return CGSize(width: width, height: height)
        }
    }
    
    // headerview
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (collectionView == menuBarCollectionView){
            return UICollectionReusableView.init()
        }else{
            let headerView = eBookCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: EBookCollectionReusableView.id, for: indexPath) as! EBookCollectionReusableView

            return headerView
        }
    }

    // headerview size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if (collectionView == menuBarCollectionView){
            return CGSize(width: 0, height: 0)
        }else{
            let width = collectionView.bounds.width
            return CGSize(width: width, height: 80)
        }
    }
}
