//
//  Onboarding.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 26.08.2022.
//

import UIKit


struct Onboarding {
    let index: Int
    let title: String
    let description: String
    let imageName: String
}

class OnboardingModel {
    func createModels() -> [Onboarding] {
        return [
            Onboarding(
                index: 0,
                title: "Приветствуем тебя",
                description: "в MobDevFactoryApp!",
                imageName: "hiImage"
            ),
            Onboarding(
                index: 1,
                title: "",
                description: "Это приложение школы мобильной разработки MobDevFactory, которое поможет тебе учиться более комфортно и эффективно!",
                imageName: "mobile-dev"
            ),
            Onboarding(
                index: 2,
                title: "Читай конспекты",
                description: "Ты можешь изучать или повторять темы конспектов в любое время со своего телефона, онлайн или офлайн.",
                imageName: "readingImage"
            ),
            Onboarding(
                index: 3,
                title: "Следи за расписанием",
                description: "Просматривай расписание своего потока и получай уведомления о новых событиях.",
                imageName: "calendarImage"
            ),
            Onboarding(
                index: 4,
                title: "Отслеживай прогресс",
                description: "Следи за своим персональным рейтингом и рейтингом своей команды.",
                imageName: "progressImage"
            ),
        ]
    }
}



extension OnboardingView {
    
    enum Metric {
        static let buttonHeight: CGFloat = 44
        static let topOffset: CGFloat = 25
        static let leftOffset: CGFloat = 40
        static let rightOffset: CGFloat = -40
        static let bottomOffset: CGFloat = -50
        
        static let stackViewSpacing: CGFloat = 16
    }


    enum Strings {
        static let nextButtonTitle: String = "Далее"
        static let startButtonTitle: String = "Начать!"
    }
}

