//
// 메인뷰 하단 collectionview header.
//
//  EBookCollectionReusableView.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/09.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import UIKit

class EBookCollectionReusableView: UICollectionReusableView {
    
    private var headerView: UIView = UIView()
    private var headerLabel: UILabel = UILabel()
    
    // cell의 id값 정의
    static var id: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented required init?(coder: NSCoder)")
    }
    
    // collectionView Header cell layout 구성
    private func setupLayout() {
        
        self.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        headerView.backgroundColor = .clear
        
        headerView.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0),
            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: 20),
            headerLabel.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        headerLabel.textAlignment = .left
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerLabel.textColor = .white
        headerLabel.text = "Google Play 검색결과"
        headerLabel.backgroundColor = .clear
    }
        
}
