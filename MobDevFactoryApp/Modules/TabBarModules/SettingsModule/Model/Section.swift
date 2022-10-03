//
//  Section.swift
//  MobDevFactoryApp
//
//  Created by Федор Донсков on 02.10.2022.
//

import UIKit

// MARK: - Section cell

struct Section {
    var title: String
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

// MARK: - Settings cell

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroungColor: UIColor?
    let handler: (() -> Void)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroungColor: UIColor?
    let handler: (() -> Void)
    var isOn: Bool
}

extension UIImage {
    convenience init?(image: Icon) {
        self.init(named: image.rawValue)
    }

    enum Icon: String {
        case account = "account"
        case notification = "notification"
        case privacySecurity = "lock"
        case darkMode = "moon"
        case language = "language"
        case quit = "quit"
    }
}
