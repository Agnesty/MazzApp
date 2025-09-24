//
//  PexelsVideoResponse.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 24/09/25.
//

import Foundation

struct PexelsVideoResponse: Decodable {
    let videos: [PexelsVideo]
}

struct PexelsVideo: Decodable, Identifiable {
    let id: Int
    let image: String
    let videoFiles: [VideoFile]
    
    enum CodingKeys: String, CodingKey {
        case id, image
        case videoFiles = "video_files"
    }
}

struct VideoFile: Decodable {
    let id: Int
    let link: String
    let quality: String
    let fileType: String
    
    enum CodingKeys: String, CodingKey {
        case id, link, quality
        case fileType = "file_type"
    }
}

