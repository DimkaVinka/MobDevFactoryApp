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
//       window?.rootViewController = ModuleBuilder.builderAuthorizationViewController()
        window?.rootViewController = OnboardingModuleBuilder.builderOnboarding()
        window?.makeKeyAndVisible()
        
    }
    
    func changeViewController(viewController: UIViewController, animated: Bool = true, animationOptions: UIView.AnimationOptions) {
        guard let window = window else { return }
            
        window.rootViewController = viewController
        let options: UIView.AnimationOptions = [animationOptions]
            
        UIView.transition(with: window,
                          duration: 0.5,
                          options: options,
                          animations: nil,
                          completion: nil)
    }
}



extension SceneDelegate {
    static var shared: SceneDelegate {
        return (UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate)
    }
}
