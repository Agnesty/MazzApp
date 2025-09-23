//
//  ProductItemView.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 21/09/25.
//

import SwiftUI
import Kingfisher

struct ProductItemView: View {
    let items: [Product]

    private let columns = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]

    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - (10 * 3)) / 2
        let imageHeight = itemWidth * 0.65
        
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(items, id: \.id) { product in
                NavigationLink {
                    ProductDetailView(items: product)
                } label: {
                    VStack(alignment: .leading, spacing: 6) {
                        
                        // MARK: - Image + Discount
                        ZStack(alignment: .topLeading) {
                            KFImage(URL(string: product.imageURL))
                                .resizable()
                                .placeholder {
                                    Color.gray.opacity(0.2)
                                }
                                .downsampling(size: CGSize(width: itemWidth * 2, height: imageHeight * 2))
                                .scaledToFill()
                                .frame(width: itemWidth, height: imageHeight)
                                .clipped()
                                .cornerRadius(6)

                            if !product.discountPercentage.isEmpty {
                                Text(product.discountPercentage)
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 4)
                                    .padding(.vertical, 2)
                                    .background(Color.red)
                                    .cornerRadius(4)
                                    .padding(6)
                            }
                        }

                        // MARK: - Info
                        VStack(alignment: .leading, spacing: 2) {
                            Text(product.productName)
                                .font(.system(size: 12, weight: .medium))
                                .lineLimit(0)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text("Rp \(product.priceAfterDiscount.formatted())")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(.red)

                            Text("Rp \(product.originalPrice.formatted())")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                                .strikethrough()

                            if !product.promoText.isEmpty {
                                Text(product.promoText)
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                    .lineLimit(1)
                            }

                            HStack(spacing: 2) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.system(size: 12))
                                Text(product.ratingText)
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                            }

                            Text(product.storeName)
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                                .lineLimit(1)
                        }
                        .padding(.horizontal, 4)
                        .padding(.bottom, 4)
                    }
                    .frame(width: itemWidth)
                    .background(Color.white)
                    .cornerRadius(6)
                    .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal, 8)
        .padding(.top, 8)
    }
}


struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyProducts = [
                Product(
                    id: 1,
                    imageName: "Keyboard Roland",
                    imageURL: "https://img.id.my-best.com/product_images/b713a4fa33565d694ec3d4d3fd504cd4.jpg",
                    discountPercentage: "",
                    productName: "5%",
                    priceAfterDiscount: 5259000,
                    originalPrice: 7399000,
                    promoText: "Hemat s.d. 5% Pakai Bonus",
                    ratingText: "4.9 • 250+ terjual",
                    storeName: "Benston Music", 
                    description: "lpokoji"
                ),
                Product(
                    id: 2,
                    imageName: "SKINTIFIC 3pcs Paket 5X Ceramide",
                    imageURL: "https://img.id.my-best.com/product_images/b713a4fa33565d694ec3d4d3fd504cd4.jpg",
                    discountPercentage: "",
                    productName: "58%",
                    priceAfterDiscount: 290615,
                    originalPrice: 699000,
                    promoText: "Hemat s.d. 5% Pakai Bonus",
                    ratingText: "4.9 • 750+ terjual",
                    storeName: "Skintific Official Store",
                    description: "gvjvjb"
                ),
                Product(
                    id: 3,
                    imageName: "Keyboard Roland",
                    imageURL: "https://images.unsplash.com/photo-1554446422-c4d46271ab85?q=80&w=2348&auto=format&fit=crop",
                    discountPercentage: "",
                    productName: "5%",
                    priceAfterDiscount: 5259000,
                    originalPrice: 7399000,
                    promoText: "Hemat s.d. 5% Pakai Bonus",
                    ratingText: "4.9 • 250+ terjual",
                    storeName: "Benston Music",
                    description: "lpokoji"
                ),
                Product(
                    id: 4,
                    imageName: "SKINTIFIC 3pcs Paket 5X Ceramide",
                    imageURL: "https://images.unsplash.com/photo-1554446422-c4d46271ab85?q=80&w=2348&auto=format&fit=crop",
                    discountPercentage: "",
                    productName: "58%",
                    priceAfterDiscount: 290615,
                    originalPrice: 699000,
                    promoText: "Hemat s.d. 5% Pakai Bonus",
                    ratingText: "4.9 • 750+ terjual",
                    storeName: "Skintific Official Store",
                    description: "gvjvjb"
                ),
                Product(
                    id: 5,
                    imageName: "Keyboard Roland",
                    imageURL: "https://images.unsplash.com/photo-1554446422-c4d46271ab85?q=80&w=2348&auto=format&fit=crop",
                    discountPercentage: "",
                    productName: "5%",
                    priceAfterDiscount: 5259000,
                    originalPrice: 7399000,
                    promoText: "Hemat s.d. 5% Pakai Bonus",
                    ratingText: "4.9 • 250+ terjual",
                    storeName: "Benston Music",
                    description: "lpokoji"
                ),
                Product(
                    id: 6,
                    imageName: "SKINTIFIC 3pcs Paket 5X Ceramide",
                    imageURL: "https://images.unsplash.com/photo-1554446422-c4d46271ab85?q=80&w=2348&auto=format&fit=crop",
                    discountPercentage: "",
                    productName: "58%",
                    priceAfterDiscount: 290615,
                    originalPrice: 699000,
                    promoText: "Hemat s.d. 5% Pakai Bonus",
                    ratingText: "4.9 • 750+ terjual",
                    storeName: "Skintific Official Store",
                    description: "gvjvjb"
                ),
                Product(
                    id: 7,
                    imageName: "Keyboard Roland",
                    imageURL: "https://images.unsplash.com/photo-1479118013749-9f79d55a28d0?q=80&w=2070&auto=format&fit=crop",
                    discountPercentage: "",
                    productName: "5%",
                    priceAfterDiscount: 5259000,
                    originalPrice: 7399000,
                    promoText: "Hemat s.d. 5% Pakai Bonus",
                    ratingText: "4.9 • 250+ terjual",
                    storeName: "Benston Music",
                    description: "lpokoji"
                ),
                Product(
                    id: 8,
                    imageName: "SKINTIFIC 3pcs Paket 5X Ceramide",
                    imageURL: "https://images.unsplash.com/photo-1479118013749-9f79d55a28d0?q=80&w=2070&auto=format&fit=crop",
                    discountPercentage: "",
                    productName: "58%",
                    priceAfterDiscount: 290615,
                    originalPrice: 699000,
                    promoText: "Hemat s.d. 5% Pakai Bonus",
                    ratingText: "4.9 • 750+ terjual",
                    storeName: "Skintific Official Store",
                    description: "gvjvjb"
                )
            ]
        ProductItemView(items: dummyProducts)
    }
}
