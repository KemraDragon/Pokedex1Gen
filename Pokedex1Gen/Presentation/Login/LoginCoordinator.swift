//
//  LoginCoordinator.swift
//  Pokedex1Gen
//
//  Created by Kevin on 29-01-25.
//

import UIKit

class LoginCoordinator {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let loginViewModel = LoginViewModel()
        let loginViewController = LoginViewController(viewModel: loginViewModel, coordinator: self)
        navigationController.setViewControllers([loginViewController], animated: false)
    }

    func showPokedex() {
        let repository = PokemonRepository()
        let useCase = GetPokemonListUseCase(repository: repository)
        let pokedexViewModel = PokedexViewModel(getPokemonListUseCase: useCase)
        let pokedexViewController = PokedexViewController(viewModel: pokedexViewModel)

        navigationController.pushViewController(pokedexViewController, animated: true)
    }
}
