//
//  HomeView.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 27/07/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel(
        homeUseCase: HomeUseCase(repository: HomeRepository()))
    @State private var selectedTab: String = "For You"
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // MARK: - Search + Icons
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search", text: .constant(""))
                            Spacer()
                            Image(systemName: "camera.fill")
                                .foregroundColor(.gray)
                        }
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        
                        Image(systemName: "cart")
                            .font(.title2)
                            .padding(.leading, 8)
                        
                        Image(systemName: "message")
                            .font(.title2)
                            .padding(.leading, 8)
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Banner
                    if let banners = viewModel.homeData?.banners {
                        BannerCarouselView(banners: banners)
                    }
                    
                    // MARK: - Detail User Card Item Buttons
                    if let cardsItem = viewModel.homeData?.detailUserCards {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(cardsItem) { card in
                                    UserCardItem(title: card.text , icon: card.iconName)}
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // MARK: - Horizontal Menu (round icons)
                    if let serviceItem = viewModel.homeData?.sellingServices {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 24) {
                                ForEach(serviceItem) { data in
                                    SellingServiceItem(title: data.title, imageUrl: data.imageUrl)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // MARK: - Sticky Header Tabs
                    if let stickyHeaderItem = viewModel.homeData?.tabsHomeMenu {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 30) {
                                ForEach(stickyHeaderItem) { tab in
                                    VStack(spacing: 4) {
                                        Text(tab.tabName)
                                            .foregroundColor(selectedTab == tab.tabName ? .black : .gray)
                                            .font(.system(size: 16, weight: selectedTab == tab.tabName ? .semibold : .regular))
                                            .onTapGesture {
                                                selectedTab = tab.tabName
                                            }
                                        
                                        // Underline
                                        Rectangle()
                                            .fill(Color.blue)
                                            .frame(height: 2)
                                            .opacity(selectedTab == tab.tabName ? 1 : 0)
                                    }
                                    .frame(minWidth: 100, alignment: .center)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top, 8)
                        }
                        .background(Color.white)
                    }
                    
                    // MARK: - Produk sesuai Tab
                    if let items = viewModel.products[selectedTab], !items.isEmpty {
                        ProductItemView(items: items)
                    } else if viewModel.isLoading {
                        ProgressView("Loading products...")
                            .frame(maxWidth: .infinity)
                            .padding(.top, 20)
                    }
                }
                .padding(.vertical)
                .padding(.top, -10)
            }
            .onAppear {
                viewModel.fetchHomeData()
                viewModel.fetchProducts()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
