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
