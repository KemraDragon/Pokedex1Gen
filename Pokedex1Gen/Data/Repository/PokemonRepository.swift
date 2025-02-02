//
//  PokemonRepository.swift
//  Pokedex1Gen
//
//  Created by Kevin on 29-01-25.
//

import Foundation

protocol PokemonRepositoryProtocol {
    func getPokemonList(url: String?, completion: @escaping (Result<PokemonListResponse, Error>) -> Void)
    func getPokemonDetail(url: String?, completion: @escaping (Result<PokemonDetailResponse, Error>) -> Void)

}

class PokemonRepository: PokemonRepositoryProtocol {
    private let api = PokemonAPI()

    /// Obtiene la lista de Pokémon desde la API, manejando la paginación.
    func getPokemonList(url: String? = nil, completion: @escaping (Result<PokemonListResponse, Error>) -> Void) {
        api.fetchPokemonList(url: url, completion: completion)
    }
    func getPokemonDetail(url: String? = nil, completion: @escaping (Result<PokemonDetailResponse, Error>) -> Void) {
        api.fetchPokemonDetail(url: url, completion: completion)
    }
}
