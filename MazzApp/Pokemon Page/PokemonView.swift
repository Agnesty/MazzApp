//
//  PokemonView.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 27/07/25.
//

import SwiftUI

struct PokemonView: View {
    let pokemons: [Pokemon] = [
        Pokemon(name: "Bulbasaur", number: "001", imageName: "bulbasaur", backgroundColor: Color.green.opacity(0.2)),
        Pokemon(name: "Ivysaur", number: "002", imageName: "ivysaur", backgroundColor: Color.blue.opacity(0.2)),
        Pokemon(name: "Venusaur", number: "003", imageName: "venusaur", backgroundColor: Color.green.opacity(0.3)),
        Pokemon(name: "Charmander", number: "004", imageName: "charmander", backgroundColor: Color.orange.opacity(0.3))
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    @State private var searchText = ""
    
    var body: some View {
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
            
            // MARK: - Grid
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(pokemons) { pokemon in
                        VStack {
                            Image(pokemon.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                            
                            Text(pokemon.name)
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Text(pokemon.number)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(pokemon.backgroundColor)
                        .cornerRadius(16)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
        }
        .padding(.top)
        .background(Color.white)
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
