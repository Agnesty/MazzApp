//
//  PokemonRepository.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 24/09/25.
//

import Foundation
import Combine

protocol PokemonRepositoryProtocol {
    func fetchPokemons(limit: Int, offset: Int) -> AnyPublisher<[Pokemon], Error>
    func fetchPokemonDetail(id: Int) -> AnyPublisher<Pokemon, Error>
}

final class PokemonRepository: PokemonRepositoryProtocol {
    private let apiClient: APIClient
    
    init(apiClient: APIClient = .shared) {
        self.apiClient = apiClient
    }
    
    func fetchPokemons(limit: Int, offset: Int) -> AnyPublisher<[Pokemon], Error> {
        apiClient.requestWithCombine(.getPokemons(limit: limit, offset: offset), type: PokemonListResponse.self)
            .flatMap { response -> AnyPublisher<[Pokemon], Error> in
                let publishers = response.results.enumerated().map { index, _ -> AnyPublisher<Pokemon, Error> in
                    let id = offset + index + 1
                    return self.apiClient.requestWithCombine(.getPokemonDetail(id: id), type: PokemonResponse.self)
                        .map { Pokemon(from: $0) }
                        .eraseToAnyPublisher()
                }
                return Publishers.MergeMany(publishers).collect().eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    func fetchPokemonDetail(id: Int) -> AnyPublisher<Pokemon, Error> {
        apiClient.requestWithCombine(.getPokemonDetail(id: id), type: PokemonResponse.self)
            .map { Pokemon(from: $0) }
            .eraseToAnyPublisher()
    }
}


