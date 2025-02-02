//
//  GetPokemonListUseCase.swift
//  Pokedex1Gen
//
//  Created by Kevin on 29-01-25.
//

import Foundation

protocol GetPokemonListUseCaseProtocol {
    func execute(url: String?, completion: @escaping (Result<PokemonListResponse, Error>) -> Void)
}

class GetPokemonListUseCase: GetPokemonListUseCaseProtocol {
    private let repository: PokemonRepositoryProtocol

    init(repository: PokemonRepositoryProtocol) {
        self.repository = repository
    }

    /// Ejecuta la solicitud para obtener la lista de Pokémon, soportando paginación.
    func execute(url: String? = nil, completion: @escaping (Result<PokemonListResponse, Error>) -> Void) {
        repository.getPokemonList(url: url, completion: completion)
    }
}
