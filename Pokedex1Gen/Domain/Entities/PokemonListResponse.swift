//
//  PokemonListResponse.swift
//  Pokedex1Gen
//
//  Created by Sebastian Cerda Fuentes on 01-02-25.
//

import Foundation

struct PokemonListResponse: Decodable {
    let next: String?
    let previous: String?
    let results: [PokemonEntry]
}

struct PokemonEntry: Decodable {
    let name: String
    let url: String
}
