//
//  HomeView.swift
//  MazzApp
//
//  Created by Phincon on 27/07/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TopBarView()
                    .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 30) {
                        BannerSwitchSection()
                        DetailUserCardSection()
                        SellingServiceSection()
                    }
                    .padding(.horizontal)
                }
            }
            .background(Color(.systemBackground))
        }
    }
}

struct TopBarView: View {
    @State private var isSearchActive = false

    var body: some View {
        HStack(spacing: 12) {
            Image("Maza")
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 0.5))
                .background(Color.cyan.opacity(0.1))
                .onTapGesture {
                    print("Icon tapped")
                }

            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                Text("Search")
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.horizontal)
            .frame(height: 36)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black.opacity(0.2), lineWidth: 0.5))
            .onTapGesture {
                isSearchActive = true
            }

            NavigationLink(destination: SearchPageView(), isActive: $isSearchActive) {
                EmptyView()
            }

            HStack(spacing: 8) {
                IconButton(systemName: "cart")
                IconButton(systemName: "bell")
                IconButton(systemName: "message")
            }
        }
    }
}

struct IconButton: View {
    let systemName: String
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
            .padding(6)
            .background(Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct BannerSwitchSection: View {
    var body: some View {
        Rectangle()
            .fill(Color.red.opacity(0.2))
            .frame(height: 150)
            .overlay(Text("BannerSwitchTableViewCell"))
    }
}

struct DetailUserCardSection: View {
    var body: some View {
        Rectangle()
            .fill(Color.green.opacity(0.2))
            .frame(height: 120)
            .overlay(Text("DetailUserCardTableViewCell"))
    }
}

struct SellingServiceSection: View {
    var body: some View {
        Rectangle()
            .fill(Color.blue.opacity(0.2))
            .frame(height: 200)
            .overlay(Text("SellingServiceTableViewCell"))
    }
}

struct SearchPageView: View {
    var body: some View {
        Text("Search Page")
            .navigationTitle("Search")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

