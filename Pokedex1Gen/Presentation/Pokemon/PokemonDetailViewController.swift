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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let heightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let locationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ver Localizaciones", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init(viewModel: PokemonDetailViewModel, pokemonUrl: String) {
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
        view.addSubview(locationButton)

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

            locationButton.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20),
            locationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationButton.widthAnchor.constraint(equalToConstant: 200),
            locationButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        locationButton.addTarget(self, action: #selector(openLocationScreen), for: .touchUpInside)
    }

    private func bindViewModel() {
        viewModel.onUpdate = { [weak self] in
            guard let self = self, let detail = self.viewModel.pokemonDetail else { return }
            DispatchQueue.main.async {
                self.nameLabel.text = detail.name.capitalized
                self.typeLabel.text = "Tipo: \(detail.types.map { $0.type.name.capitalized }.joined(separator: ", "))"
                self.heightLabel.text = "Altura: \(detail.height) dm"
                self.weightLabel.text = "Peso: \(detail.weight) hg"
                
                if let spriteUrl = URL(string: detail.sprites.front_default) {
                    self.loadImage(from: spriteUrl)
                }
            }
        }
    }

    private func loadImage(from url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.pokemonImageView.image = image
                }
            }
        }
    }

    @objc private func openLocationScreen() {
        let locationVC = LocationViewController(encounterAreas: viewModel.encounterAreas)
        navigationController?.pushViewController(locationVC, animated: true)
    }
}
