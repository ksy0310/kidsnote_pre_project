//
// 로딩 view.
//
//  LoadingIndicator.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/14.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//
import Foundation
import UIKit

public class LoadingIndicator {

    public static let shared = LoadingIndicator()
    private var blurImg = UIImageView()
    private var indicator = UIActivityIndicatorView()

    private init() {
        blurImg.frame = UIScreen.main.bounds
        blurImg.backgroundColor = UIColor.black
        blurImg.isUserInteractionEnabled = true
        blurImg.alpha = 0.5
        indicator.style = .large
        indicator.center = blurImg.center
        indicator.startAnimating()
        indicator.color = UIColor(named: "pointBlueColor")
    }

    func showIndicator() {
        DispatchQueue.main.async( execute: {
            UIApplication.shared.keyWindow?.addSubview(self.blurImg)
            UIApplication.shared.keyWindow?.addSubview(self.indicator)
        })
    }
    func hideIndicator() {

        DispatchQueue.main.async( execute:
            {
                self.blurImg.removeFromSuperview()
                self.indicator.removeFromSuperview()
        })
    }
}
