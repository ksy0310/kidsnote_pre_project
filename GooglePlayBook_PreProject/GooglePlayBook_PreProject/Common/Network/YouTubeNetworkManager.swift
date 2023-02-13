//
//  YouTubeNetworkManager.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/12.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import Foundation

struct YouTubeNetworkManager {
    
    static let shared = YouTubeNetworkManager()
    
    let key = "&key=" + Bundle.main.apiKey
    let baseUrl = "https://www.googleapis.com/youtube/v3/search?q="
    let param = "&part=snippet&type=video"
    let indexString = "&startIndex="
    let maxSizeInt = 20
    let maxSize = "&maxResults=20"
    
    func getVideoData(searchText: String,index: Int,completion: @escaping (Result<Any, Error>) -> ()) {
        
        // 입력 텍스트가 공백이 있으면 +로 대체
        let searchString = searchText.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        
        let indexCount = (maxSizeInt * index) + 1
        
        let urlString = baseUrl + searchString + param + indexString + String(indexCount) + maxSize + key
        // 한글 가능
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

        if let url = URL(string: encodedString) {
            let session = URLSession(configuration: .default)
            
            var requestURL = URLRequest(url: url)
            requestURL.httpMethod = "GET"
            
            let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(YouTubeApiResponse.self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            dataTask.resume()
        }
    }
    
}
