//
//  MenuBarCollectionViewCell.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/08.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import UIKit

class MenuBarCollectionViewCell: UICollectionViewCell {
    var menuTitle: UILabel = UILabel()
    var bottomView: UIView = UIView()
    
    // cell의 id값 정의
    static var id: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        isSelected = false
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented required init?(coder: NSCoder)")
    }
    
    // collectionView cell layout 구성
    private func setupLayout() {
        // 메뉴 타이틀
        contentView.addSubview(menuTitle)
        menuTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            menuTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            menuTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
        
        menuTitle.backgroundColor = .clear
        menuTitle.font = UIFont.systemFont(ofSize: 17)
        menuTitle.textColor = UIColor(named: "mainTextColor")
        menuTitle.textAlignment = .center
        
        // 하단 뷰
        contentView.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            bottomView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bottomView.widthAnchor.constraint(equalTo: menuTitle.widthAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 1),
        ])
        
        bottomView.backgroundColor = UIColor(named: "pointBlueColor")

        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 3
        bottomView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    // 선택시 UI 변경
    override var isHighlighted: Bool {
        didSet {
            if isSelected {
                menuTitle.textColor = UIColor(named: "pointBlueColor")
                bottomView.isHidden = false
            }
            else {
                menuTitle.textColor = UIColor(named: "mainTextColor")
                bottomView.isHidden = true
            }
        }
    }
    // 선택시 UI 변경
    override var isSelected: Bool {
        didSet {
            if isSelected {
                menuTitle.textColor = UIColor(named: "pointBlueColor")
                bottomView.isHidden = false
            }
            else {
                menuTitle.textColor = UIColor(named: "mainTextColor")
                bottomView.isHidden = true
            }
        }
    }
}
