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
                                                  icon: UIImage(image: .account),
                                                  iconBackgroungColor: nil) {

                                                  }),
                .staticCell(model: SettingsOption(title: "Уведомления",
                                                  icon: UIImage(image: .notification),
                                                  iconBackgroungColor: nil) {

                                                  }),
                .staticCell(model: SettingsOption(title: "Конфиденциальность и безопасность",
                                                  icon: UIImage(image: .privacySecurity),
                                                  iconBackgroungColor: nil) {

                                                  }),
                .switchCell(model: SettingsSwitchOption(title: "Темный режим",
                                                        icon: UIImage(image: .darkMode),
                                                        iconBackgroungColor: nil,
                                                        handler: {

                                                        },
                                                        isOn: false))
            ]),

            Section(title: "Дополнительные", options: [
                .staticCell(model: SettingsOption(title: "Язык",
                                                  icon: UIImage(image: .language),
                                                  iconBackgroungColor: nil) {
                                                      //                                                      SceneDelegate.shared.changeViewController(viewController: LanguageViewController(), animationOptions: .curveEaseOut)
                                                  }),
                .staticCell(model: SettingsOption(title: "Выйти",
                                                  icon: UIImage(image: .quit),
                                                  iconBackgroungColor: nil) {

                                                  })
            ])
        ]
    }
}
