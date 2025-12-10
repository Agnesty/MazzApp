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
    @State private var showErrorSheet = false
    @State private var sheetTitle = ""
    @State private var sheetMessage = ""
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // Search Bar
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField(languange.search, text: .constant(""))
                            Spacer()
                            Image(systemName: "camera.fill")
                                .foregroundColor(.gray)
                        }
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        
                        Image(systemName: "cart").font(.title2)
                        Image(systemName: "message").font(.title2)
                    }
                    .padding(.horizontal)
                    
                    // Banner
                    if let banners = viewModel.homeData?.banners {
                        BannerCarouselView(banners: banners)
                    }
                    
                    // User Cards
                    if let cardsItem = viewModel.homeData?.detailUserCards {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(cardsItem) { card in
                                    UserCardItem(title: card.text , icon: card.iconName)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // Selling Services
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
                    
                    // Tabs
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
                    
                    // Products
                    if let items = viewModel.products[selectedTab], !items.isEmpty {
                        ProductItemView(items: items)
                    } else if viewModel.isLoading {
                        ProgressView(languange.loadingProducts)
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
            
            .onReceive(viewModel.$errorMessage) { error in
                if let error = error {
                    sheetTitle = languange.error
                    sheetMessage = error
                    showErrorSheet = true
                }
            }
        }
        
        .overlay(
            Group {
                if showErrorSheet {
                    VStack {
                        Spacer()
                        NewBottomSheetView(
                            title: sheetTitle,
                            message: sheetMessage,
                            yesTitle: languange.tryAgain,
                            imgDrawer: UIImage(named: "errorNetworkState") ?? UIImage(),
                            onConfirmed: { _ in
                                showErrorSheet = false
                                viewModel.fetchHomeData()
                                viewModel.fetchProducts()
                            },
                            isPresented: $showErrorSheet
                        )
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea() 
                    .background(Color.black.opacity(0.45).ignoresSafeArea())
                    .transition(.move(edge: .bottom))
                    .animation(.easeOut(duration: 0.25), value: showErrorSheet)
                }
            }
        )

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
