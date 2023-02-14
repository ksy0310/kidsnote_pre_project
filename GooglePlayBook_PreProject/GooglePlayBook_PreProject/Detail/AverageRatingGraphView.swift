//
//  AverageRatingGraphView.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/14.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import UIKit

class AverageRatingGraphView: UIView {
    
    static let view = AverageRatingGraphView()
    
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
            self.addSubview(stackView)

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
            self.addSubview(stackView)

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
            self.addSubview(stackView)

            NSLayoutConstraint.activate([
                stackView.heightAnchor.constraint(equalToConstant: 20)
            ])
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        // leftLayoutView
        leftLayoutView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(leftLayoutView)
        leftLayoutView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            leftLayoutView.topAnchor.constraint(equalTo: self.topAnchor),
            leftLayoutView.heightAnchor.constraint(equalToConstant: 130),
            leftLayoutView.widthAnchor.constraint(equalToConstant: 140),
            leftLayoutView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
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
        self.addSubview(rightLayoutView)
        rightLayoutView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            rightLayoutView.topAnchor.constraint(equalTo: self.topAnchor),
            rightLayoutView.heightAnchor.constraint(equalToConstant: 130),
            rightLayoutView.leadingAnchor.constraint(equalTo: leftLayoutView.trailingAnchor, constant: 0),
            rightLayoutView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
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
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 별점 데이터-그래프 UI
    public func setDataRatingGraphView(reviewCountString: String, ratingCountString: String) {
        
        reviewCountLabel.text = "평점 " + reviewCountString + "개"
        ratingCountLabel.text = ratingCountString
        
        
        let count = ratingCountString
        let countString = count[count.startIndex]
        print("!!!",countString)
        
        switch countString {
            case "5":
                //5점
                //별
                one_starImageView.image = UIImage(named: "star_blue")
                two_starImageView.image = UIImage(named: "star_blue")
                three_starImageView.image = UIImage(named: "star_blue")
                four_starImageView.image = UIImage(named: "star_blue")
                five_starImageView.image = UIImage(named: "star_blue")
                //그래프
                oneGraphView.backgroundColor = UIColor(named: "pointBlueColor")
                twoGraphView.backgroundColor = .darkGray
                threeGraphView.backgroundColor = .darkGray
                fourGraphView.backgroundColor = .darkGray
                fiveGraphView.backgroundColor = .darkGray
                    
            case "4":
                //4점
                //별
                one_starImageView.image = UIImage(named: "star_blue")
                two_starImageView.image = UIImage(named: "star_blue")
                three_starImageView.image = UIImage(named: "star_blue")
                four_starImageView.image = UIImage(named: "star_blue")
                five_starImageView.image = UIImage(named: "star")
                //그래프
                oneGraphView.backgroundColor = .darkGray
                twoGraphView.backgroundColor = UIColor(named: "pointBlueColor")
                threeGraphView.backgroundColor = .darkGray
                fourGraphView.backgroundColor = .darkGray
                fiveGraphView.backgroundColor = .darkGray
                    
            case "3":
                //3점
                //별
                one_starImageView.image = UIImage(named: "star_blue")
                two_starImageView.image = UIImage(named: "star_blue")
                three_starImageView.image = UIImage(named: "star_blue")
                four_starImageView.image = UIImage(named: "star")
                five_starImageView.image = UIImage(named: "star")
                //그래프
                oneGraphView.backgroundColor = .darkGray
                twoGraphView.backgroundColor = .darkGray
                threeGraphView.backgroundColor = UIColor(named: "pointBlueColor")
                fourGraphView.backgroundColor = .darkGray
                fiveGraphView.backgroundColor = .darkGray
                    
            case "2":
                //2점
                //별
                one_starImageView.image = UIImage(named: "star_blue")
                two_starImageView.image = UIImage(named: "star_blue")
                three_starImageView.image = UIImage(named: "star")
                four_starImageView.image = UIImage(named: "star")
                    five_starImageView.image = UIImage(named: "star")
                //그래프
                oneGraphView.backgroundColor = .darkGray
                twoGraphView.backgroundColor = .darkGray
                threeGraphView.backgroundColor = .darkGray
                fourGraphView.backgroundColor = UIColor(named: "pointBlueColor")
                fiveGraphView.backgroundColor = .darkGray
                    
            case "1":
                //1점
                //별
                one_starImageView.image = UIImage(named: "star_blue")
                two_starImageView.image = UIImage(named: "star")
                three_starImageView.image = UIImage(named: "star")
                four_starImageView.image = UIImage(named: "star")
                five_starImageView.image = UIImage(named: "star")
                //그래프
                oneGraphView.backgroundColor = .darkGray
                twoGraphView.backgroundColor = .darkGray
                threeGraphView.backgroundColor = .darkGray
                fourGraphView.backgroundColor = .darkGray
                fiveGraphView.backgroundColor = UIColor(named: "pointBlueColor")
                    
            default:
                //0점,점수없음
                //별
                one_starImageView.image = UIImage(named: "star")
                two_starImageView.image = UIImage(named: "star")
                three_starImageView.image = UIImage(named: "star")
                four_starImageView.image = UIImage(named: "star")
                five_starImageView.image = UIImage(named: "star")
                //그래프
                oneGraphView.backgroundColor = .darkGray
                twoGraphView.backgroundColor = .darkGray
                threeGraphView.backgroundColor = .darkGray
                fourGraphView.backgroundColor = .darkGray
                fiveGraphView.backgroundColor = .darkGray
        }
        
    }
    
}
