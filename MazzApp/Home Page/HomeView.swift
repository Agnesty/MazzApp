//
//  HomeView.swift
//  MazzApp
//
//  Created by Phincon on 27/07/25.
//

import SwiftUI

struct HomeView: View {
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
                    BannerCarouselView()
                    
                    // MARK: - Shortcut Buttons
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            UserCardItem(title: "Rp0", icon: "tag.fill")
                            UserCardItem(title: "Cek Kupon", icon: "ticket.fill")
                            UserCardItem(title: "Dikirim ke", icon: "location.fill")
                            UserCardItem(title: "Dikirim ke", icon: "location.fill")
                            UserCardItem(title: "Dikirim ke", icon: "location.fill")
                        }
                        .padding(.horizontal)
                    }
                    
                    // MARK: - Horizontal Menu (round icons)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 24) {
                            SellingServiceItem(title: "Promo Hari Ini", image: "gift.fill")
                            SellingServiceItem(title: "Top-Up & Tagihan", image: "creditcard.fill")
                            SellingServiceItem(title: "Cicil Tanpa Bunga", image: "dollarsign.circle.fill")
                            SellingServiceItem(title: "GoPay Later", image: "wallet.pass.fill")
                            SellingServiceItem(title: "Beauty", image: "heart.fill")
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
                .padding(.top, -10)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
