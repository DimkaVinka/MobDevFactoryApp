//
//  SettingsViewModel.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 09.09.2022.
//

import UIKit
import Combine

class SettingsViewModel {

    @Published var sections = [Section]()

    func createModel() {
        sections = [
            Section(title: "Основные", options: [
                .staticCell(model: SettingsOption(title: "Аккаунт",
                                                  icon: UIImage(systemName: "person.circle"),
                                                  iconBackgroungColor: nil) {

                                                  }),
                .staticCell(model: SettingsOption(title: "Уведомления",
                                                  icon: UIImage(systemName: "bell.circle"),
                                                  iconBackgroungColor: nil) {

                                                  }),
                .staticCell(model: SettingsOption(title: "Конфиденциальность и безопасность",
                                                  icon: UIImage(systemName: "lock.circle"),
                                                  iconBackgroungColor: nil) {

                                                  }),
                .switchCell(model: SettingsSwitchOption(title: "Темный режим",
                                                        icon: UIImage(systemName: "moon.circle"),
                                                        iconBackgroungColor: nil,
                                                        handler: {

                                                        },
                                                        isOn: false))
            ]),

            Section(title: "Дополнительные", options: [
                .staticCell(model: SettingsOption(title: "Язык",
                                                  icon: UIImage(systemName: "network"),
                                                  iconBackgroungColor: nil) {
                                                      //                                                      SceneDelegate.shared.changeViewController(viewController: LanguageViewController(), animationOptions: .curveEaseOut)
                                                  }),
                .staticCell(model: SettingsOption(title: "Выйти",
                                                  icon: UIImage(systemName: "figure.roll"),
                                                  iconBackgroungColor: nil) {

                                                  })
            ])
        ]
    }
}
