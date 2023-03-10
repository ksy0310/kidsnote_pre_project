//
// 페이지 이동 애니메이션, 이미지string으로 load, textField clear button.
//
//  Extensions.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/10.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import UIKit


extension UIViewController {
    // 페이지 이동 애니메이션
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)

        present(viewControllerToPresent, animated: false)
    }

    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)

        dismiss(animated: false)
    }
}

// 이미지 url string값 -> load
extension UIImageView {
    func load(urlString: String) {
        let url = URL(string: urlString)!
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

// 검색 TextField clear button
extension UITextField {
    func clearButtonCustom() {

        clearButtonMode = .never
        rightViewMode   = .whileEditing
        
        let clearButton = UIButton(frame: rightViewRect(forBounds: bounds))
        clearButton.frame.size = CGSize(width: 10, height: 10)
        clearButton.setImage(UIImage(named: "cancel"), for: .normal)
        clearButton.addTarget(self, action: #selector(UITextField.clear(sender:)), for: .touchUpInside)
        
        rightView = clearButton
    }

    @objc func clear(sender : AnyObject) {
        self.text = ""
        sendActions(for: .editingChanged)
    }
}
