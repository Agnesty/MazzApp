//
//  LiveViewModel.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 24/09/25.
//

import Combine
import Foundation

final class LiveViewModel: ObservableObject {
    @Published var videos: [PexelsVideo] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let repository: LiveRepositoryProtocol
    
    init(repository: LiveRepositoryProtocol = LiveRepository.shared) {
        self.repository = repository
    }
    
    func fetchVideos() {
        isLoading = true
        errorMessage = nil
        
        repository.fetchPopularVideos()
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] videos in
                self?.videos = videos
            }
            .store(in: &cancellables)
    }
}
