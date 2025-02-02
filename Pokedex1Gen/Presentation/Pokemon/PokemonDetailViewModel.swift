//
//  PokemonDetailViewModel.swift
//  Pokedex1Gen
//
//  Created by Sebastian Cerda Fuentes on 01-02-25.
//

import Foundation

class PokemonDetailViewModel {
    private let getPokemonDetailUseCase: GetPokemonDetailUseCaseProtocol

    // Datos del Pokémon que serán utilizados en la vista
    var pokemonDetail: PokemonDetailResponse? {
        didSet {
            onUpdate?()
        }
    }

    // Callback para actualizar la vista cuando cambian los datos
    var onUpdate: (() -> Void)?

    var onError: ((String) -> Void)?

    init(getPokemonDetailUseCase: GetPokemonDetailUseCaseProtocol) {
        self.getPokemonDetailUseCase = getPokemonDetailUseCase
    }

    /// Obtiene los detalles del Pokémon seleccionado
    func fetchPokemonDetail(pokemonUrl: String) {
        getPokemonDetailUseCase.execute(url: pokemonUrl) { [weak self] result in
            switch result {
            case .success(let detail):
                self?.pokemonDetail = detail
            case .failure(let error):
                self?.onError?("Error al obtener los detalles: \(error.localizedDescription)")
            }
        }
    }
}


