//
//  SceneDelegate.swift
//  Pokedex1Gen
//
//  Created by Kevin on 29-01-25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Crear la ventana manualmente
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = LoginViewController() // Apuntamos al Login
        window?.makeKeyAndVisible()
    }
}
