//
// 메인뷰에서 상단 메뉴 탭 cell.
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
    }
    
    // 선택시 UI 변경
    override var isHighlighted: Bool {
        didSet {
            if isSelected {
                menuTitle.textColor = UIColor(named: "pointBlueColor")
            }
            else {
                menuTitle.textColor = UIColor(named: "mainTextColor")
            }
        }
    }
    // 선택시 UI 변경
    override var isSelected: Bool {
        didSet {
            if isSelected {
                menuTitle.textColor = UIColor(named: "pointBlueColor")
            }
            else {
                menuTitle.textColor = UIColor(named: "mainTextColor")
            }
        }
    }
}
