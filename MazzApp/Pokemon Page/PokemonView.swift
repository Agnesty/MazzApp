//
//  PokemonView.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 27/07/25.
//

import SwiftUI
import Kingfisher

struct PokemonView: View {
    @StateObject private var viewModel = PokemonViewModel(
        useCase: PokemonUseCase(repository: PokemonRepository())
    )
    
    @State private var searchText = ""
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var filteredPokemons: [Pokemon] {
        if searchText.isEmpty {
            return viewModel.pokemons
        } else {
            return viewModel.pokemons.filter { pokemon in
                pokemon.name.lowercased().contains(searchText.lowercased()) ||
                "\(pokemon.id)".contains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                
                // MARK: - Title & Subtitle
                VStack(alignment: .leading, spacing: 4) {
                    Text("Pokédex")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.purple)
                    
                    Text("Search for a Pokémon by name or using its National Pokédex number.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // MARK: - Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Name or number", text: $searchText)
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "line.3.horizontal.decrease.circle.fill")
                            .foregroundColor(.purple)
                            .font(.title2)
                    }
                }
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                // MARK: - Content Area
                ScrollView {
                    if viewModel.isLoading {
                        VStack {
                            ProgressView("Loading Pokémons...")
                                .padding(.top, 40)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                    } else if let error = viewModel.errorMessage {
                        Text("❌ \(error)")
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(filteredPokemons, id: \.id) { pokemon in
                                NavigationLink {
                                    PokemonDetailView(pokemonId: pokemon.id)
                                        .environmentObject(viewModel)
                                } label: {
                                    VStack {
                                        if let imageUrl = pokemon.imageUrl,
                                           let url = URL(string: imageUrl) {
                                            KFImage(url)
                                                .placeholder {
                                                    ProgressView()
                                                        .frame(height: 80)
                                                }
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 80)
                                        } else {
                                            Image(systemName: "xmark.octagon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 80)
                                                .foregroundColor(.red)
                                        }
                                        
                                        Text(pokemon.name)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                        
                                        Text("#\(pokemon.id)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue.opacity(0.1))
                                    .cornerRadius(16)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                    }
                }
            }
            .padding(.top)
            .background(Color.white)
            .onAppear {
                viewModel.fetchPokemons(limit: 20, offset: 0)
            }
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
