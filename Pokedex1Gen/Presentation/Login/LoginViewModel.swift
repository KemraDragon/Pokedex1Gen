//
//  LoginViewModel.swift
//  Pokedex1Gen
//
//  Created by Kevin on 29-01-25.
//

import Foundation

class LoginViewModel {
    var onLoginSuccess: (() -> Void)?
    var onLoginFailure: ((String) -> Void)?

    func login(username: String, password: String) {
        let validUsername = "Usuario"
        let validPassword = "123456"

        if username == validUsername && password == validPassword {
            onLoginSuccess?()
        } else {
            onLoginFailure?("Credenciales incorrectas. Intenta nuevamente.")
        }
    }
}
