//
//  NetworkManager.swift
//  Pokedex1Gen
//
//  Created by Kevin on 29-01-25.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func fetchData<T: Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: endpoint) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    func fetchEncounterAreas(for pokemonID: Int, completion: @escaping (Result<[EncounterArea], Error>) -> Void) {
        let urlString = "https://pokeapi.co/api/v2/pokemon/\(pokemonID)/encounters"
        // KEVIN, TENIAS EL SLASH EQUIVOCADO Y POR LO TANTO PENSABA QUE POKEMONID ERA PARTE DEL STRING,
        // \ ESE SLASH ES EL CORRECTO PARA PASAR UN VALOR DISTINTO DENTRO DE UN STRING
        fetchData(endpoint: urlString, completion: completion)
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
}
