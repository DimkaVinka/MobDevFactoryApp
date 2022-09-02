//
//  OnboardingModuleBuilder.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 26.08.2022.
//
import UIKit

final class OnboardingModuleBuilder {
    static func builderOnboarding() -> UIViewController {
        let viewController = OnboardingViewModel()
        return viewController
    }
}
