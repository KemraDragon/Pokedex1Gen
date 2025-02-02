//
//  PokemonDetailViewController.swift
//  Pokedex1Gen
//
//  Created by Sebastian Cerda Fuentes on 01-02-25.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    private let viewModel: PokemonDetailViewModel

    private let url: String

    private let pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let heightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(
        viewModel: PokemonDetailViewModel,
        pokemonUrl: String
    ) {
        self.viewModel = viewModel
        self.url = pokemonUrl
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchPokemonDetail(pokemonUrl: url)
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(pokemonImageView)
        view.addSubview(nameLabel)
        view.addSubview(typeLabel)
        view.addSubview(heightLabel)
        view.addSubview(weightLabel)
        view.addSubview(locationLabel)

        NSLayoutConstraint.activate([
            pokemonImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pokemonImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 150),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 150),

            nameLabel.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            typeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            heightLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            heightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            weightLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 10),
            weightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            locationLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func bindViewModel() {
        viewModel.onUpdate = { [weak self] in
            guard let self = self, let detail = self.viewModel.pokemonDetail else { return }

            DispatchQueue.main.async {
                self.nameLabel.text = detail.name.capitalized
                self.typeLabel.text = "Tipo: " + detail.types.map { $0.type.name.capitalized }.joined(separator: ", ")
                self.heightLabel.text = "Altura: \(detail.height) dm"
                self.weightLabel.text = "Peso: \(detail.weight) hg"
                self.locationLabel.text = "Ubicación: lol weon x2"

                let imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(detail.id).png"
                self.loadImage(from: imageUrl)
            }
        }

        viewModel.onError = { [weak self] errorMessage in
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true)
            }
        }
    }

    private func loadImage(from url: String) {
        guard let imageUrl = URL(string: url) else { return }

        URLSession.shared.dataTask(with: imageUrl) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }

            DispatchQueue.main.async {
                self.pokemonImageView.image = image
            }
        }.resume()
    }
}
