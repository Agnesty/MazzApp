//
//  HomeRepositoryProtocol.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 21/09/25.
//

import Foundation
import Combine

protocol HomeRepositoryProtocol {
    func fetchHomeData() -> AnyPublisher<HomeResponse, Error>
    func fetchProducts() -> AnyPublisher<[ProductResponse], Error>
    func fetchProductDetail(id: Int) -> AnyPublisher<Product, Error>
}

final class HomeRepository: HomeRepositoryProtocol {
    private let apiClient: APIClient
    
    init(apiClient: APIClient = .shared) {
        self.apiClient = apiClient
    }
    
    func fetchHomeData() -> AnyPublisher<HomeResponse, Error> {
        apiClient.requestWithCombine(.getHomeData, type: HomeResponse.self)
    }
    
    func fetchProducts() -> AnyPublisher<[ProductResponse], Error> {
        apiClient.requestWithCombine(.getProducts, type: [ProductResponse].self)
    }
    
    func fetchProductDetail(id: Int) -> AnyPublisher<Product, Error> {
        apiClient.requestWithCombine(.getProductDetail(id: id), type: Product.self)
    }
}
