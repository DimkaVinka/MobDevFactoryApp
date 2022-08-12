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
        textField.placeholder = "Nick Name"
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        return textField
    }()
    
    private var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Metric.cornelRadiusView
        textField.clearButtonMode = .always
        textField.placeholder = "First Name"
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        return textField
    }()
    
    private var secondNameTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Metric.cornelRadiusView
        textField.clearButtonMode = .always
        textField.placeholder = "Second Name"
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Metric.cornelRadiusView
        textField.clearButtonMode = .always
        textField.placeholder = "Password"
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
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
            make.top.equalTo(view).offset(200)
            make.width.equalTo(150)
            make.height.equalTo(Metric.heightView)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(-70)
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
        user.nickName = nickNameTextField.text ?? "empty"
        user.name = firstNameTextField.text ?? "empty"
        user.surName = secondNameTextField.text ?? "empty"
        user.password = passwordTextField.text ?? "empty"
        
        storageManager.addUser(user)
    }
}


