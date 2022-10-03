//
//  SettingSwitchTableCell.swift
//  MobDevFactoryApp
//
//  Created by Федор Донсков on 02.10.2022.
//

import UIKit
import SnapKit

class SettingSwitchTableCell: UITableViewCell {

    static let switchIdentifire = "SwitchTableViewCell"

    // MARK: - Private properties

    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()

    private let mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = .systemGreen
        mySwitch.addTarget(self, action: #selector(changeScreenMode), for: .valueChanged)
        return mySwitch
    }()

    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 15
        return stack
    }()

    // MARK: - Methods

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Private methods

    public func configure(with model: SettingsSwitchOption) {
        nameLabel.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroungColor
        mySwitch.isOn = model.isOn
    }

    private func setupHierarchy() {
        contentView.addSubview(stack)
        stack.addArrangedSubview(iconContainer)
        stack.addArrangedSubview(nameLabel)
        contentView.addSubview(mySwitch)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
    }

    private func setupLayout() {

        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(stack.snp.centerY)
        }

        iconImageView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(iconContainer)
            make.center.equalTo(iconContainer)
        }

        iconContainer.snp.makeConstraints { make in
            make.top.left.bottom.equalTo(stack).offset(5)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(30)
        }

        mySwitch.snp.makeConstraints { make in
            make.right.equalTo(contentView).offset(-15)
            make.centerY.equalTo(contentView)
        }

        stack.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(15)
            make.right.equalTo(mySwitch.snp.left).offset(-15)
            make.bottom.equalTo(contentView).offset(-10)
            make.centerY.equalTo(contentView)
        }
    }

    // MARK: - Actions

    @objc private func changeScreenMode(sender: UISwitch) {
        if sender.isOn {
            window?.overrideUserInterfaceStyle = .dark
        } else {
            window?.overrideUserInterfaceStyle = .light
        }
    }
}
