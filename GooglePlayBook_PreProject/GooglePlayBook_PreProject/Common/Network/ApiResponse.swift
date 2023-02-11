//
//  ApiResponse.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/11.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import Foundation
import UIKit

struct Book: Codable {
    let volumeInfo: VolumeInfo
}

struct VolumeInfo: Codable {
    let title: String
    let subtitle: String?
    let previewLink: String?
    let publishedDate: String
    let publisher: String?
    let authors: [String]?
    let description: String?
    let infoLink : String?
    let averageRating: Double?
    let ratingsCount: Double?
    let imageLinks: imageUrl?
}
struct imageUrl: Codable {
    let smallThumbnail: String?
    let thumbnail: String?
}
struct ApiResponse: Codable {
    let kind: String
    let totalItems: Int
    let items: [Book]
}
