//
//  OnboardingModel.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 20.08.2022.
//

import Foundation


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
