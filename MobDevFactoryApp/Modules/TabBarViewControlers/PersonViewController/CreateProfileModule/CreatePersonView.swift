//
//  CreatePersonView.swift
//  MobDevFactoryApp
//
//  Created by Федор Донсков on 17.08.2022.
//

import UIKit
import SnapKit

class CreateProfileView: UIView {
    
    // MARK: - UI Elements
    
    private lazy var editProfileLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Редактировать профиль"
        return label
    }()
    
    lazy var profilePhotoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "noImage")
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .systemOrange
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 110
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
        return textField
    }()
    
    private lazy var editStatusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        label.text = "Статус"
        return label
    }()
    
    var editStatusTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 15
        textField.clearButtonMode = .always
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
        return textField
    }()
    
    lazy var saveProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .orange
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
//        button.addTarget(self, action: #selector(tapButtonSettingsController), for: .touchUpInside)
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
        addSubview(editStatusLabel)
        addSubview(editStatusTextField)
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
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        profilePhotoImage.snp.makeConstraints { make in
            make.top.equalTo(editProfileLabel.snp.bottom).offset(35)
            make.centerX.equalTo(self.snp.centerX)
            make.height.equalTo(220)
            make.width.equalTo(220)
        }
        
        firstEditNameLabel.snp.makeConstraints { make in
            make.top.equalTo(profilePhotoImage.snp.bottom).offset(20)
            make.leading.equalTo(self.snp.leading).offset(23)
            make.trailing.equalTo(self.snp.trailing).offset(-23)
        }
        
        firstNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstEditNameLabel.snp.bottom).offset(10)
            make.leading.equalTo(firstEditNameLabel.snp.leading)
            make.trailing.equalTo(firstEditNameLabel.snp.trailing)
            make.height.equalTo(40)
        }
        
        editStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(firstNameTextField.snp.bottom).offset(10)
            make.leading.equalTo(firstNameTextField.snp.leading)
            make.trailing.equalTo(firstNameTextField.snp.trailing)
        }
        
        editStatusTextField.snp.makeConstraints { make in
            make.top.equalTo(editStatusLabel.snp.bottom).offset(10)
            make.leading.equalTo(editStatusLabel.snp.leading)
            make.trailing.equalTo(editStatusLabel.snp.trailing)
            make.height.equalTo(40)
        }
        
        editCityLabel.snp.makeConstraints { make in
            make.top.equalTo(editStatusTextField.snp.bottom).offset(10)
            make.leading.equalTo(editStatusTextField.snp.leading)
            make.trailing.equalTo(editStatusTextField.snp.trailing)
        }
        
        editCityTextField.snp.makeConstraints { make in
            make.top.equalTo(editCityLabel.snp.bottom).offset(10)
            make.leading.equalTo(editCityLabel.snp.leading)
            make.trailing.equalTo(editCityLabel.snp.trailing)
            make.height.equalTo(40)
        }
        
        editMailLabel.snp.makeConstraints { make in
            make.top.equalTo(editCityTextField.snp.bottom).offset(10)
            make.leading.equalTo(editCityTextField.snp.leading)
            make.trailing.equalTo(editCityTextField.snp.trailing)
        }
        
        editMailTextField.snp.makeConstraints { make in
            make.top.equalTo(editMailLabel.snp.bottom).offset(10)
            make.leading.equalTo(editMailLabel.snp.leading)
            make.trailing.equalTo(editMailLabel.snp.trailing)
            make.height.equalTo(40)
        }
        
        saveProfileButton.snp.makeConstraints { make in
            make.top.equalTo(editMailTextField.snp.bottom).offset(40)
            make.leading.equalTo(editMailTextField.snp.leading)
            make.trailing.equalTo(editMailTextField.snp.trailing)
            make.height.equalTo(40)
        }
    }
}
