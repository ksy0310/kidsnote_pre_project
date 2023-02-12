//
//  GooglePlayBook_PreProject++ Bundle.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/12.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import Foundation

extension Bundle {
    var apiKey: String {
        guard let file = self.path(forResource: "GooglePlayBookInfo", ofType: "plist") else { return "" }
        
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["API_KEY"] as? String else { fatalError("GooglePlayBookInfo.plist에 API_KEY 설정을 해주세요.")}
        return key
    }
    
}
