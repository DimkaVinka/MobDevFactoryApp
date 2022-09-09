//
//  ModuleBuilder.swift
//  MobDevFactoryApp
//
//  Created by Дмитрий Виноградов on 08.08.2022.
//

import UIKit

final class ModuleBuilder {
//    static func builderExampleModule() -> UIViewController {
//        let viewController = ExampleViewController()
//        let viewModel = ExampleViewModel()
//        viewController.viewModel = viewModel
//        return viewController
//    }
//
//    static func builderExampleSecondModule() -> UIViewController {
//        let viewController = SecondExampleViewController()
//        let viewModel = SecondExampleViewModel()
//        viewController.viewModel = viewModel
//        return viewController
//    }
    
    static func builderTabBarController() -> UIViewController {
        let viewController = TabBarController()
        return viewController
    }
    
    static func builderAuthorizationViewController() -> UIViewController {
        let viewController = AuthorizationViewController()
        return viewController
    }
    
    static func builderRegistrationViewController() -> UIViewController {
        let viewController = RegistrationViewController()
        return viewController
    }
    
    static func builderCreateNewUser() -> UIViewController {
        let view = CreatePersonView()
        let viewController = CreatePersonViewController()
        view.delegate = viewController
        func dismissVC() {
            viewController.dismiss(animated: true)
        }
        return viewController
    }
}
