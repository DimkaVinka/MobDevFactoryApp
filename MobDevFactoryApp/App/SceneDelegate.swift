//
//  SceneDelegate.swift
//  MobDevFactoryApp
//
//  Created by Дмитрий Виноградов on 08.08.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        window?.rootViewController = ModuleBuilder.builderAuthorizationViewController()
        window?.makeKeyAndVisible()
    }
}

