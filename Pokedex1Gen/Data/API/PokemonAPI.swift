//
//  PokemonAPI.swift
//  Pokedex1Gen
//
//  Created by Kevin on 29-01-25.
//

import Foundation

class PokemonAPI {
    private let baseURL = "https://pokeapi.co/api/v2/pokemon"

    /// Obtiene la lista de Pokémon desde la API, permitiendo paginación.
    func fetchPokemonList(url: String? = nil, completion: @escaping (Result<PokemonListResponse, Error>) -> Void) {
        let urlString = url ?? "\(baseURL)?limit=151"
        NetworkManager.shared.fetchData(endpoint: urlString, completion: completion)
    }
    func fetchPokemonDetail(url: String? = nil, completion: @escaping (Result<PokemonDetailResponse, Error>) -> Void) {
        let urlString = url ?? ""
        NetworkManager.shared.fetchData(endpoint: urlString, completion: completion)
    }
}
