//
//  GetHomeUseCase.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 21/09/25.
//

import Foundation
import Combine

protocol HomeUseCaseProtocol {
    func fetchHomeData() -> AnyPublisher<HomeResponse, Error>
    func fetchProducts() -> AnyPublisher<[ProductResponse], Error>
    func fetchProductDetail(id: Int) -> AnyPublisher<Product, Error>
}

final class HomeUseCase: HomeUseCaseProtocol {
    private let repository: HomeRepositoryProtocol
    
    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchHomeData() -> AnyPublisher<HomeResponse, Error> {
        repository.fetchHomeData()
    }
    
    func fetchProducts() -> AnyPublisher<[ProductResponse], Error> {
        repository.fetchProducts()
    }
    
    func fetchProductDetail(id: Int) -> AnyPublisher<Product, Error> {
        repository.fetchProductDetail(id: id)
    }
}
