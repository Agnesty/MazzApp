//
//  APIError.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 18/09/25.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case decoding
    case network(Error)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return languange.invalidURL
        case .decoding:
            return languange.decoding
        case .network(let err):
            return languange.network(err.localizedDescription)
        case .unknown:
            return languange.unknown
        }
    }
}

