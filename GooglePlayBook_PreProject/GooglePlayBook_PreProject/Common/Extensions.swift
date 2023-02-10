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
