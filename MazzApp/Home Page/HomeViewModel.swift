//
//  HomeViewModel.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 19/09/25.
//

import Foundation
import Combine
import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var homeData: HomeResponse?
    @Published var products: [String: [Product]] = [:]
    @Published var selectedProduct: Product?
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let homeUseCase: HomeUseCaseProtocol
    
    init(homeUseCase: HomeUseCaseProtocol) {
        self.homeUseCase = homeUseCase
    }
    
    func fetchHomeData() {
        isLoading = true
        errorMessage = nil
        
        homeUseCase.fetchHomeData()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] response in
                self?.homeData = response
            }
            .store(in: &cancellables)
    }
    
    func fetchProducts() {
        isLoading = true
        errorMessage = nil
        
        homeUseCase.fetchProducts()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] groups in
                var dict: [String: [Product]] = [:]
                for group in groups {
                    dict[group.productSource] = group.products
                }
                self?.products = dict
                print("📦 Produk per tab: \(dict.keys)")
            }
            .store(in: &cancellables)
    }
    
    func fetchProductDetail(id: Int) {
        isLoading = true
        errorMessage = nil
        
        homeUseCase.fetchProductDetail(id: id)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] product in
                self?.selectedProduct = product
            }
            .store(in: &cancellables)
    }
}
