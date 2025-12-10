//
//  Localization.swift
//  MazzApp
//
//  Created by 2171 on 06/12/25.
//

import Foundation

enum languange {
    // Home
    static var search: String { "search".localized }
    static var loadingProducts: String { "loading.products".localized }

    // Errors
    static var error: String { "error".localized }
    static var tryAgain: String { "try.again".localized }
    
    // API Errors
    static var invalidURL: String { "error.invalid.url".localized }
    static var decoding: String { "decoding".localized }
    static func network(_ msg: String) -> String { String(format: "network.issue".localized, msg) }
    static var unknown: String { "unknown".localized }
}
