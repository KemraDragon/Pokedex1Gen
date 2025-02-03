//
//  PokemonDetailViewModel.swift
//  Pokedex1Gen
//
//  Created by Sebastian Cerda Fuentes on 01-02-25.
//

import Foundation

class PokemonDetailViewModel {
    private let getPokemonDetailUseCase: GetPokemonDetailUseCaseProtocol
    private let networkManager = NetworkManager.shared

    var pokemonDetail: PokemonDetailResponse? {
        didSet { onUpdate?() }
    }

    var encounterAreas: [EncounterArea] = [] {
        didSet { onEncounterAreasUpdate?() }
    }

    var onUpdate: (() -> Void)?
    var onEncounterAreasUpdate: (() -> Void)?
    var onError: ((String) -> Void)?

    init(getPokemonDetailUseCase: GetPokemonDetailUseCaseProtocol) {
        self.getPokemonDetailUseCase = getPokemonDetailUseCase
    }

    func fetchPokemonDetail(pokemonUrl: String) {
        getPokemonDetailUseCase.execute(url: pokemonUrl) { [weak self] result in
            switch result {
            case .success(let detail):
                guard let self = self else { return }
                self.pokemonDetail = detail
                self.fetchEncounterAreas(pokemonID: detail.id)
            case .failure(let error):
                self?.onError?("Error al obtener los detalles: (error.localizedDescription)")
            }
        }
    }

    private func fetchEncounterAreas(pokemonID: Int) {
        networkManager.fetchEncounterAreas(for: pokemonID) { [weak self] result in
            switch result {
            case .success(let areas):
                self?.encounterAreas = areas
                self?.onEncounterAreasUpdate?()
             case .failure(let error):
                self?.onError?("Error al obtener áreas de encuentro: (error.localizedDescription)")
            }
        }
    }
}
