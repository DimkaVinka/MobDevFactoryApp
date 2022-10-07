//
//  RegistrationViewController.swift
//  MobDevFactoryApp
//
//  Created by Daniil Litvinov on 10.08.2022.
//

import UIKit
import SnapKit
import RealmSwift

class RegistrationViewController: UIViewController {
    
    private var alert = Alert()
    private var alertTab = AlertTabBar()
    
    var storageManager = StorageManager()
    
    private var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.setTitle("Войти в систему", for: .normal)
        button.addTarget(self, action: #selector(tapButtonSign), for: .touchUpInside)
        return button
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Регистрация"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private var nickNameTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Metric.cornelRadiusView
        textField.clearButtonMode = .always
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        textField.placeholder = "Nick Name"
        return textField
    }()
    
    private var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Metric.cornelRadiusView
        textField.clearButtonMode = .always
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        textField.placeholder = "First Name"
        return textField
    }()
    
    private var secondNameTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Metric.cornelRadiusView
        textField.clearButtonMode = .always
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        textField.placeholder = "Second Name"
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Metric.cornelRadiusView
        textField.clearButtonMode = .always
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        textField.placeholder = "Password"
        return textField
    }()
    
    private var proceedNewAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .orange
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Metric.cornelRadiusView
        button.setTitle("Регистрация", for: .normal)
        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: Life cicle RegistrationViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Metric.colorBackround
        setupHerarcy()
        setupView()
        
        storageManager.makeStorage()
    }
    //MARK: Setup RegistrationViewController
    private func setupHerarcy(){
        view.addSubview(signInButton)
        view.addSubview(label)
        view.addSubview(nickNameTextField)
        view.addSubview(firstNameTextField)
        view.addSubview(secondNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(proceedNewAccountButton)
    }
    
    private func setupView(){
        signInButton.snp.makeConstraints { make in
            make.left.equalTo(view)
            make.top.equalTo(view).offset(100)
            make.width.equalTo(150)
            make.height.equalTo(Metric.heightView)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(signInButton).offset(70)
            make.width.equalTo(250)
        }
        
        nickNameTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(label).offset(60)
            make.width.equalTo(Metric.widthTextFild)
            make.height.equalTo(Metric.heightView)
        }
        
        firstNameTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(nickNameTextField).offset(60)
            make.width.equalTo(Metric.widthTextFild)
            make.height.equalTo(Metric.heightView)
        }
        
        secondNameTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(firstNameTextField).offset(60)
            make.width.equalTo(Metric.widthTextFild)
            make.height.equalTo(Metric.heightView)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(secondNameTextField).offset(60)
            make.width.equalTo(Metric.widthTextFild)
            make.height.equalTo(Metric.heightView)
        }
        
        proceedNewAccountButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(passwordTextField).offset(60)
            make.width.equalTo(Metric.widthTextFild)
            make.height.equalTo(Metric.heightView)
        }
    }
    //MARK: Actions RegistrationViewController
    @objc func tapButtonSign() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func registerButtonPressed() {
        
        let user = User()

        if  nickNameTextField.text == "" ||
            secondNameTextField.text == "" ||
            firstNameTextField.text == "" ||
            passwordTextField.text == ""
        {
            alert.showAlert(title: "Заполните все поля", viewComtroller: self)
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                user.nickName = self.nickNameTextField.text ?? "empty"
                user.name = self.firstNameTextField.text ?? "empty"
                user.surName = self.secondNameTextField.text ?? "empty"
                user.password = self.passwordTextField.text ?? "empty"
                self.storageManager.addUser(user)
                SceneDelegate.shared.changeViewController(viewController: ModuleBuilder.builderTabBarController(),
                                                          animationOptions: .transitionCrossDissolve)
            }
            alertTab.showAlertTabBar(title: "Поздравляю!!! Вы зарегистрировались", viewComtroller: self)
        }
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    
}
