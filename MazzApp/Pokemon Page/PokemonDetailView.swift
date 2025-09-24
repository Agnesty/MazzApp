//
//  PokemonDetailView.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 24/09/25.
//

import Foundation
import SwiftUI
import Kingfisher

struct PokemonDetailView: View {
    let pokemonId: Int
    @EnvironmentObject var viewModel: PokemonViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedTab: String = "Forms"
    
    let tabs = ["Forms", "Detail", "Types", "Stats", "Weakness"]
    
    var body: some View {
        VStack(spacing: 16) {
            
            // MARK: - Header
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.purple)
                }
                Spacer()
                Text(viewModel.selectedPokemon?.name ?? "Loading...")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                Spacer()
                Spacer().frame(width: 24)
            }
            .padding(.horizontal)
            
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let pokemon = viewModel.selectedPokemon {
                
                // MARK: - Pokemon Image (Kingfisher)
                if let imageUrl = pokemon.imageUrl,
                   let url = URL(string: imageUrl) {
                    KFImage(url)
                        .placeholder {
                            ProgressView()
                        }
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 220, maxHeight: 220)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                        .padding(.horizontal)
                }
                
                // MARK: - Tabs
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 24) {
                        ForEach(tabs, id: \.self) { tab in
                            VStack(spacing: 4) {
                                Text(tab)
                                    .font(.system(size: 16, weight: tab == selectedTab ? .bold : .regular))
                                    .foregroundColor(tab == selectedTab ? .purple : .gray)
                                
                                Rectangle()
                                    .fill(tab == selectedTab ? Color.purple : Color.clear)
                                    .frame(height: 2)
                            }
                            .onTapGesture { selectedTab = tab }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // MARK: - Tab Content
                if selectedTab == "Forms" {
                    VStack(alignment: .leading, spacing: 12) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                if let imageUrl = pokemon.imageUrl,
                                   let url = URL(string: imageUrl) {
                                    KFImage(url)
                                        .placeholder { Color.gray.opacity(0.2) }
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .padding(8)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(12)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        Text("Mega Evolution")
                            .font(.headline)
                            .foregroundColor(.purple)
                            .padding(.horizontal)
                        
                        Text("In order to support its flower, which has grown larger due to Mega Evolution, its back and legs have become stronger.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    }
                    .padding(.top, 8)
                }
                
                if selectedTab == "Types" {
                    VStack(spacing: 8) {
                        ForEach(pokemon.types, id: \.self) { type in
                            Text(type)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 6)
                                .frame(maxWidth: .infinity)
                                .background(Color.purple)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                }
            } else if let error = viewModel.errorMessage {
                Text("❌ \(error)")
                    .foregroundColor(.red)
                    .padding()
            }
            
            Spacer()
        }
        .background(Color.white.ignoresSafeArea())
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            viewModel.fetchPokemonDetail(id: pokemonId)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PokemonViewModel(
            useCase: PokemonUseCase(repository: PokemonRepository())
        )
        
        viewModel.selectedPokemon = Pokemon(
            id: 3,
            name: "Venusaur",
            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png",
            types: ["Grass", "Poison"]
        )
        
        return PokemonDetailView(pokemonId: 3)
            .environmentObject(viewModel)
    }
}

