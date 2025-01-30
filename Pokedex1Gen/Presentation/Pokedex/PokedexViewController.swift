//
//  PokedexViewController.swift
//  Pokedex1Gen
//
//  Created by Kevin on 29-01-25.
//

import UIKit

class PokedexViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Pokédex - Primera Generación"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
}
