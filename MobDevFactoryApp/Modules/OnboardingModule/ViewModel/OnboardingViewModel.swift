//
//  OnboardingViewModel.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 26.08.2022.
//


import UIKit

class OnboardingViewModel: UIViewController {
    var model: OnboardingModel?

    private var onboardingView: OnboardingView? {
        guard isViewLoaded else { return nil }
        return view as? OnboardingView
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view = OnboardingView()
        
        model = OnboardingModel()
        configureView()
    }
}

// MARK: - Configurations
private extension OnboardingViewModel {
    func configureView() {
        guard let models = model?.createModels() else { return }
        models.forEach { [unowned self] model in
            onboardingView?.configureView(with: [model])
        }
        onboardingView?.configureView(with: models)
    }
}

