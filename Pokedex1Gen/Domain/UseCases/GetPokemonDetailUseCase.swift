//
//  GetPokemonDetailUseCase.swift
//  Pokedex1Gen
//
//  Created by Sebastian Cerda Fuentes on 01-02-25.
//

import Foundation

protocol GetPokemonDetailUseCaseProtocol {
    func execute(url: String?, completion: @escaping (Result<PokemonDetailResponse, Error>) -> Void)
}

class GetPokemonDetailUseCase: GetPokemonDetailUseCaseProtocol {
    private let repository: PokemonRepositoryProtocol

    init(repository: PokemonRepositoryProtocol) {
        self.repository = repository
    }

    /// Ejecuta la solicitud para obtener la lista de Pokémon, soportando paginación.
    func execute(url: String? = nil, completion: @escaping (Result<PokemonDetailResponse, Error>) -> Void) {
        repository.getPokemonDetail(url: url, completion: completion)
    }
}
