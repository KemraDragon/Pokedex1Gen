//
//  PokedexViewModel.swift
//  Pokedex1Gen
//
//  Created by Kevin on 29-01-25.
//

import Foundation

class PokedexViewModel {
    private let getPokemonListUseCase: GetPokemonListUseCaseProtocol
    private var nextPageURL: String? = nil
    private var previousPageURL: String? = nil

    // Lista pública de Pokémon que será utilizada en la vista
    var pokemonList: [PokemonEntry] = [] {
        didSet {
            onUpdate?()
        }
    }

    // Callback para actualizar la vista cuando cambian los datos
    var onUpdate: (() -> Void)?

    init(getPokemonListUseCase: GetPokemonListUseCaseProtocol) {
        self.getPokemonListUseCase = getPokemonListUseCase
    }

    /// Obtiene la lista inicial de Pokémon (primeros 151)
    func fetchPokemonList() {
        getPokemonListUseCase.execute(url: nil) { [weak self] result in
            switch result {
            case .success(let response):
                self?.pokemonList = response.results
                self?.nextPageURL = response.next
                self?.previousPageURL = response.previous
            case .failure(let error):
                print("Error al obtener los Pokémon: \(error.localizedDescription)")
            }
        }
    }
}
