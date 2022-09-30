//
//  AppDelegate.swift
//  MobDevFactoryApp
//
//  Created by Дмитрий Виноградов on 08.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        
//        let storage = StorageManager()
//        for item in storage.items {
////            if item.isLogged == true {
////                storage.makeStorage()
////                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeViewController(
////                    viewController: ,
////                        animated: true,
////                        animationOptions: .transitionFlipFromBottom
////                )
////            }
//        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

