//
//  EncounterArea.swift
//  Pokedex1Gen
//
//  Created by Kevin on 03-02-25.
//

import Foundation

struct EncounterArea: Decodable {
    let locationArea: NamedAPIResource

    enum CodingKeys: String, CodingKey {
        case locationArea = "location_area"
    }
}

struct NamedAPIResource: Decodable {
    let name: String
    let url: String
}
