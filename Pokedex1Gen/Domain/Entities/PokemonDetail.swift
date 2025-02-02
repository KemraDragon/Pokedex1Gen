//
//  PokemonDetail.swift
//  Pokedex1Gen
//
//  Created by Sebastian Cerda Fuentes on 01-02-25.
//

import Foundation

struct PokemonDetailResponse: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [PokemonType]
    let abilities: [PokemonAbility]
    let stats: [PokemonStat]
}

struct PokemonType: Decodable {
    let type: TypeInfo
}

struct TypeInfo: Decodable {
    let name: String
}

struct PokemonAbility: Decodable {
    let ability: AbilityInfo
}

struct AbilityInfo: Decodable {
    let name: String
}

struct PokemonStat: Decodable {
    let stat: StatInfo
    let base_stat: Int
}

struct StatInfo: Decodable {
    let name: String
}

struct PokemonSpeciesResponse: Decodable {
    let flavorTextEntries: [FlavorTextEntry]

    enum CodingKeys: String, CodingKey {
        case flavorTextEntries = "flavor_text_entries"
    }
}

struct FlavorTextEntry: Decodable {
    let flavorText: String
    let language: Language

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
    }
}

struct Language: Decodable {
    let name: String
}

struct PokemonLocation: Decodable {
    let locationArea: LocationArea

    enum CodingKeys: String, CodingKey {
        case locationArea = "location_area"
    }
}

struct LocationArea: Decodable {
    let name: String
}
