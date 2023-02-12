//
//  EBookCollectionViewCell.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/09.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import UIKit

class EBookCollectionViewCell: UICollectionViewCell {
    
    var eBookTitleLabel: UILabel = UILabel()
    var eBookAuthorsLabel: UILabel = UILabel()
    var eBookKindLabel: UILabel = UILabel()
    var eBookAverageRatingLabel: UILabel = UILabel()
    var eBookThumbnailImageView: UIImageView = UIImageView()
    
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
    
    // collectionView cell layout 구성
    private func setupLayout() {
        
        // ebook Thumbnail
        contentView.addSubview(eBookThumbnailImageView)
        eBookThumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eBookThumbnailImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            eBookThumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            eBookThumbnailImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            eBookThumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            eBookThumbnailImageView.widthAnchor.constraint(equalToConstant: 65),
        ])
        
        eBookThumbnailImageView.image = UIImage(named: "noimage")
        eBookThumbnailImageView.contentMode = .scaleAspectFit
        eBookThumbnailImageView.backgroundColor = .darkGray
        eBookThumbnailImageView.clipsToBounds = true
        eBookThumbnailImageView.layer.cornerRadius = 10
        
        // eBook Title
        contentView.addSubview(eBookTitleLabel)
        eBookTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eBookTitleLabel.leadingAnchor.constraint(equalTo: eBookThumbnailImageView.trailingAnchor, constant: 10),
            eBookTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            eBookTitleLabel.topAnchor.constraint(equalTo: eBookThumbnailImageView.topAnchor, constant: 0),
        ])
        
        eBookTitleLabel.backgroundColor = .clear
        eBookTitleLabel.font = UIFont.systemFont(ofSize: 16)
        eBookTitleLabel.textColor = .white
        eBookTitleLabel.textAlignment = .left
        eBookTitleLabel.numberOfLines = 2
        eBookTitleLabel.text = "이북 책 제목"
        
        // eBook Authors
        contentView.addSubview(eBookAuthorsLabel)
        eBookAuthorsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eBookAuthorsLabel.leadingAnchor.constraint(equalTo: eBookThumbnailImageView.trailingAnchor, constant: 10),
            eBookAuthorsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            eBookAuthorsLabel.topAnchor.constraint(equalTo: eBookTitleLabel.bottomAnchor, constant: 5),
        ])
        
        eBookAuthorsLabel.backgroundColor = .clear
        eBookAuthorsLabel.font = UIFont.systemFont(ofSize: 14)
        eBookAuthorsLabel.textColor = UIColor(named: "mainTextColor")
        eBookAuthorsLabel.textAlignment = .left
        eBookAuthorsLabel.text = "이북 책 작가"
        
        // eBook Kind
        contentView.addSubview(eBookKindLabel)
        eBookKindLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            eBookKindLabel.leadingAnchor.constraint(equalTo: eBookThumbnailImageView.trailingAnchor, constant: 10),
            eBookKindLabel.topAnchor.constraint(equalTo: eBookAuthorsLabel.bottomAnchor, constant: 3),
        ])

        eBookKindLabel.backgroundColor = .clear
        eBookKindLabel.font = UIFont.systemFont(ofSize: 14)
        eBookKindLabel.textColor = UIColor(named: "mainTextColor")
        eBookKindLabel.textAlignment = .left
        eBookKindLabel.text = "eBook"
        
        // eBook AverageRating
        contentView.addSubview(eBookAverageRatingLabel)
        eBookAverageRatingLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            eBookAverageRatingLabel.leadingAnchor.constraint(equalTo: eBookKindLabel.trailingAnchor, constant: 5),
            eBookAverageRatingLabel.topAnchor.constraint(equalTo: eBookKindLabel.topAnchor, constant: 0),
        ])
        
        eBookAverageRatingLabel.backgroundColor = .clear
        eBookAverageRatingLabel.font = UIFont.systemFont(ofSize: 14)
        eBookAverageRatingLabel.textColor = UIColor(named: "mainTextColor")
        eBookAverageRatingLabel.textAlignment = .left
        eBookAverageRatingLabel.text = "5.0★"
    }
}
