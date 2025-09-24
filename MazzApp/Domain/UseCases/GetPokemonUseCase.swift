//
//  GetPokemonUseCase.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 24/09/25.
//

import Foundation
import Combine

protocol PokemonUseCaseProtocol {
    func getPokemons(limit: Int, offset: Int) -> AnyPublisher<[Pokemon], Error>
    func getPokemonDetail(id: Int) -> AnyPublisher<Pokemon, Error>
}

final class PokemonUseCase: PokemonUseCaseProtocol {
    private let repository: PokemonRepositoryProtocol
    
    init(repository: PokemonRepositoryProtocol) {
        self.repository = repository
    }
    
    func getPokemons(limit: Int, offset: Int) -> AnyPublisher<[Pokemon], Error> {
        repository.fetchPokemons(limit: limit, offset: offset)
    }
    
    func getPokemonDetail(id: Int) -> AnyPublisher<Pokemon, Error> {
        repository.fetchPokemonDetail(id: id)
    }
}

