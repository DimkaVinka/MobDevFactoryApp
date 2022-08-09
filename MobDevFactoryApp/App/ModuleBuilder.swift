//
//  ModuleBuilder.swift
//  MobDevFactoryApp
//
//  Created by Дмитрий Виноградов on 08.08.2022.
//

import UIKit

final class ModuleBuilder {
    static func builderExampleModule() -> UIViewController {
        let viewController = ExampleViewController()
        let viewModel = ExampleViewModel()
        viewController.viewModel = viewModel
        return viewController
    }
    
    static func builderExampleSecondModule() -> UIViewController {
        let viewController = SecondExampleViewController()
        let viewModel = SecondExampleViewModel()
        viewController.viewModel = viewModel
        return viewController
    }
}
