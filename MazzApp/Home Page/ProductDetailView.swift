//
//  ProductDetailView.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 23/09/25.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    let items: Product
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let imageHeight = screenWidth * 0.6
        
        VStack(spacing: 0) {
            
            // MARK: - Custom Top Bar
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                Spacer()
                HStack(spacing: 20) {
                    Button(action: {}) {
                        Image(systemName: "heart")
                            .foregroundColor(.black)
                    }
                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.black)
                    }
                    Button(action: {}) {
                        Image(systemName: "cart")
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            .frame(height: 35)
            .background(Color.white)
            .shadow(color: .black.opacity(0.05), radius: 2, y: 1)
            
            // MARK: - Scroll Content
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    KFImage(URL(string: items.imageURL))
                        .resizable()
                        .scaledToFill()
                        .frame(width: screenWidth, height: imageHeight)
                        .clipped()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(items.productName)
                            .font(.headline)
                        
                        HStack(spacing: 8) {
                            Text("Rp \(items.priceAfterDiscount.formatted())")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Spacer()
                            Text("Rp \(items.originalPrice.formatted())")
                                .font(.title3)
                                .strikethrough()
                                .foregroundColor(.gray)
                        }
                        
                        if !items.discountPercentage.isEmpty {
                            Text("Discount: \(items.discountPercentage)")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity) 
                                .padding(.vertical, 8)
                                .background(
                                    Capsule()
                                        .fill(Color.red)
                                )
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.caption)
                            Text(items.ratingText)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        if !items.promoText.isEmpty {
                            Text(items.promoText)
                                .font(.subheadline)
                                .foregroundColor(.red)
                        }
                        
                        Text(items.storeName)
                            .font(.subheadline)
                        
                        Text(items.description)
                            .font(.subheadline)
                    }
                    .padding(.horizontal)
                }
            }
            
            // MARK: - Bottom Buttons
            HStack(spacing: 16) {
                Button(action: {}) {
                    Text("Beli Sekarang")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(12)
                }
                
                Button(action: {}) {
                    Text("+ Keranjang")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 25)
            .background(Color.white.shadow(radius: 2))
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(items:
                            Product(
                                id: 7,
                                imageName: "Keyboard Roland",
                                imageURL: "https://images.unsplash.com/photo-1479118013749-9f79d55a28d0?q=80&w=2070&auto=format&fit=crop",
                                discountPercentage: "50%",
                                productName: "5%",
                                priceAfterDiscount: 5259000,
                                originalPrice: 7399000,
                                promoText: "Hemat s.d. 5% Pakai Bonus",
                                ratingText: "4.9 • 250+ terjual",
                                storeName: "Benston Music",
                                description: "lpokoji"
                            ))
    }
}
