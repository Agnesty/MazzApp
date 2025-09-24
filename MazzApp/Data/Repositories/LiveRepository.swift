//
//  LiveRepository.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 24/09/25.
//

import Foundation
import Combine

protocol LiveRepositoryProtocol {
    func fetchPopularVideos() -> AnyPublisher<[PexelsVideo], Error>
}

final class LiveRepository: LiveRepositoryProtocol {
    static let shared = LiveRepository()
    private init() {}
    
    private var apiKey: String {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let key = dict["PEXELS_API_KEY"] as? String else {
            fatalError("❌ Missing PEXELS_API_KEY in Config.plist")
        }
        return key
    }
    
    func fetchPopularVideos() -> AnyPublisher<[PexelsVideo], Error> {
        var request = URLRequest(url: URL(string: "https://api.pexels.com/videos/popular?per_page=10&page=1")!)
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: PexelsVideoResponse.self, decoder: JSONDecoder())
            .map { $0.videos }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

