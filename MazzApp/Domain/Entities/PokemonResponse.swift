//
//  PokemonResponse.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 23/09/25.
//

import Foundation
import SwiftUI

struct Pokemon: Identifiable {
    let id = UUID()
    let name: String
    let number: String
    let imageName: String
    let backgroundColor: Color
}
