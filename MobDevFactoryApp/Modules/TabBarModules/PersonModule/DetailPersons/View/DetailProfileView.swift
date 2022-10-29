//
//  DetailProfileView.swift
//  MobDevFactoryApp
//
//  Created by Федор Донсков on 04.10.2022.
//

import UIKit
import SnapKit

class DetailProfileView: UIView {

    // MARK: - Properties

    private lazy var editProfileLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Редактировать профиль"
        return label
    }()

    lazy var profilePhotoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "noImage")
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .systemOrange
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 90
        return image
    }()

    private lazy var firstEditNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        label.text = "Имя"
        return label
    }()

    var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 15
        textField.clearButtonMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        return textField
    }()

    private lazy var editCityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        label.text = "Город"
        return label
    }()

    var editCityTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 15
        textField.clearButtonMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        return textField
    }()

    private lazy var editMailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        label.text = "Почта"
        return label
    }()

    var editMailTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 15
        textField.clearButtonMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        return textField
    }()

    lazy var saveProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font =  .systemFont(ofSize: 17)
        button.setTitle("Сохранить", for: .normal)
        button.tintColor = .white
        button.backgroundColor = Metric.blueCustom
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(tapButtonSettingsController), for: .touchUpInside)
        return button
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Peivate methods

    private func setupHierarchy() {
        addSubview(editProfileLabel)
        addSubview(profilePhotoImage)
        addSubview(firstEditNameLabel)
        addSubview(firstNameTextField)
        addSubview(editCityLabel)
        addSubview(editCityTextField)
        addSubview(editMailLabel)
        addSubview(editMailTextField)
        addSubview(saveProfileButton)

        setupView()
        setupLayout()
    }

    private func setupView() {
        backgroundColor = Metric.colorBackround
    }

    // MARK: - Constraints

    private func setupLayout() {

        editProfileLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(70)
            make.centerX.equalTo(self.snp.centerX)
        }

        profilePhotoImage.snp.makeConstraints { make in
            make.top.equalTo(editProfileLabel.snp.bottom).offset(15)
            make.centerX.equalTo(editProfileLabel.snp.centerX)
            make.height.equalTo(180)
            make.width.equalTo(180)
        }

        firstEditNameLabel.snp.makeConstraints { make in
            make.top.equalTo(profilePhotoImage.snp.bottom).offset(17)
            make.leading.equalTo(self.snp.leading).offset(30)
            make.trailing.equalTo(self.snp.trailing).offset(-30)
        }

        firstNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstEditNameLabel.snp.bottom).offset(6)
            make.leading.equalTo(firstEditNameLabel.snp.leading)
            make.trailing.equalTo(firstEditNameLabel.snp.trailing)
            make.height.equalTo(36)
        }

        editCityLabel.snp.makeConstraints { make in
            make.top.equalTo(firstNameTextField.snp.bottom).offset(17)
            make.leading.equalTo(firstNameTextField.snp.leading)
            make.trailing.equalTo(firstNameTextField.snp.trailing)
        }

        editCityTextField.snp.makeConstraints { make in
            make.top.equalTo(editCityLabel.snp.bottom).offset(6)
            make.leading.equalTo(editCityLabel.snp.leading)
            make.trailing.equalTo(editCityLabel.snp.trailing)
            make.height.equalTo(36)
        }

        editMailLabel.snp.makeConstraints { make in
            make.top.equalTo(editCityTextField.snp.bottom).offset(17)
            make.leading.equalTo(editCityTextField.snp.leading)
            make.trailing.equalTo(editCityTextField.snp.trailing)
        }

        editMailTextField.snp.makeConstraints { make in
            make.top.equalTo(editMailLabel.snp.bottom).offset(6)
            make.leading.equalTo(editMailLabel.snp.leading)
            make.trailing.equalTo(editMailLabel.snp.trailing)
            make.height.equalTo(36)
        }

        saveProfileButton.snp.makeConstraints { make in
            make.top.equalTo(editMailTextField.snp.bottomMargin).offset(45)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(240)
            make.height.equalTo(45)
        }
    }

    // MARK: - Actions

    @objc private func tapButtonSettingsController() {
//        self.delegate?.dissmiss()
        print("button pressed")
    }
}

