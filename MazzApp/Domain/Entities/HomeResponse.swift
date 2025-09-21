//
//  HomeResponse.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 21/09/25.
//

import Foundation
import SwiftUI

struct HomeResponse: Decodable {
    let banners: [Banners]
    let detailUserCards: [DetailUserCardItemModel]
    let sellingServices: [SellingServiceItemModel]
    let tabsHomeMenu: [TabsHomeMenu]
}

struct Banners: Decodable, Identifiable {
    let id: Int
    let imageUrl: String
}

struct DetailUserCardItemModel: Decodable, Identifiable {
    let id: Int
    let iconName: String
    let text: String
    let bgColorHex: String
}

struct SellingServiceItemModel: Decodable, Identifiable {
    let id: Int
    let imageUrl: String
    let title: String
}

struct TabsHomeMenu: Decodable, Identifiable {
    let id: Int
    let tabName: String
}
