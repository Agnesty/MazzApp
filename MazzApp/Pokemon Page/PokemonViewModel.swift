//
//  PokemonViewModel.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 24/09/25.
//

import Combine
import SwiftUI

final class PokemonViewModel: ObservableObject {

    @Published var pokemons: [Pokemon] = []
    @Published var selectedPokemon: Pokemon?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let useCase: PokemonUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(useCase: PokemonUseCaseProtocol) {
        self.useCase = useCase
    }
    
    // MARK: - Fetch Pokemon List
    func fetchPokemons(limit: Int = 20, offset: Int = 0) {
        isLoading = true
        useCase.getPokemons(limit: limit, offset: offset)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] pokemons in
                self?.pokemons = pokemons
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Fetch Pokemon Detail
    func fetchPokemonDetail(id: Int) {
        isLoading = true
        useCase.getPokemonDetail(id: id)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] pokemon in
                self?.selectedPokemon = pokemon
            }
            .store(in: &cancellables)
    }
}
