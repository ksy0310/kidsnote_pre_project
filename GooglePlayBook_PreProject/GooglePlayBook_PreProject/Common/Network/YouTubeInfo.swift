//
//  YouTubeInfo.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/12.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import Foundation
import UIKit

struct Youtube: Codable {
    let id: videoId?
    let snippet: Snippet
}
struct Snippet: Codable {
    let title: String?
    let description: String?
    let publishedAt: String?
    let channelTitle : String?
    let thumbnails: thumbnailsUrl?
}
struct thumbnailsUrl: Codable {
    let high: imgUrl?
    let medium: imgUrl?
}
struct imgUrl: Codable {
    let url: String?
    let width: Double?
    let height: Double?
}
struct YouTubeApiResponse: Codable {
    let kind: String?
    let items: [Youtube]
}
struct videoId: Codable {
    let kind: String?
    let videoId: String?
}
