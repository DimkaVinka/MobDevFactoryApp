//
//  SettingTableCell.swift
//  MobDevFactoryApp
//
//  Created by Федор Донсков on 02.10.2022.
//

import UIKit
import SnapKit

class SettingTableCell: UITableViewCell {

    static let identifire = "SettingTableCell"

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
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
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

        configureCell()
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Private methods

    private func configureCell() {
        accessoryType = .disclosureIndicator
    }

    public func configure(with model: SettingsOption) {
        nameLabel.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroungColor
    }

    private func setupHierarchy() {
        contentView.addSubview(stack)
        iconContainer.addSubview(iconImageView)
        stack.addArrangedSubview(iconContainer)
        stack.addArrangedSubview(nameLabel)
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

        stack.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(15)
            make.right.equalTo(contentView).offset(-15)
            make.bottom.equalTo(contentView).offset(-10)
            make.centerY.equalTo(contentView)
        }
    }
}
