//
//  LoginViewController.swift
//  Pokedex1Gen
//
//  Created by Kevin on 29-01-25.
//

import UIKit

class LoginViewController: UIViewController {

    private let validUsername = "Kevin"
    private let validPassword = "Guitarra123!"

    // Componentes UI
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bienvenido a la Pokédex de Kanto"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Usuario"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Contraseña"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Iniciar Sesión", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        // Agregar las vistas al ViewController
        view.addSubview(topView)
        view.addSubview(bottomView)
        view.addSubview(titleLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)

        // Configuración de constraints
        NSLayoutConstraint.activate([
            // Vista Superior (Roja)
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),

            // Vista Inferior (Gris)
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),

            // Título
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),

            // Campo de Usuario
            usernameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),

            // Campo de Contraseña
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),

            // Botón de Iniciar Sesión
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            loginButton.heightAnchor.constraint(equalToConstant: 45)
        ])

        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }

    @objc private func handleLogin() {
        guard let username = usernameTextField.text, let password = passwordTextField.text else { return }

        if username == validUsername && password == validPassword {
            navigateToPokedex()
        } else {
            showAlert(message: "Usuario o contraseña incorrectos")
        }
    }

    private func navigateToPokedex() {
        let pokedexVC = PokedexViewController()
        pokedexVC.modalPresentationStyle = .fullScreen
        present(pokedexVC, animated: true)
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}


