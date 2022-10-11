//
//  AuthorizationViewController.swift
//  MobDevFactoryApp
//
//  Created by Daniil Litvinov on 10.08.2022.
//


import UIKit
import SnapKit
import RealmSwift

class AuthorizationViewController: UIViewController {
    
    private var storageManager = StorageManager()
    private var alert = Alert()
    
    //MARK: Views
    private let imageLogoMDF: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logoMDF")
        return image
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Войти в систему"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private var nickNameTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .black
        textField.becomeFirstResponder()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Metric.cornelRadiusView
        textField.clearButtonMode = .always
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        textField.placeholder = "Nick Name"
        textField.returnKeyType = .next
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
        textField.returnKeyType = .done
        return textField
    }()
    
    private var proceedButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .orange
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Metric.cornelRadiusView
        button.setTitle("Продолжить", for: .normal)
        button.addTarget(self, action: #selector(tapButtonTabBarController), for: .touchUpInside)
        return button
    }()
    //MARK: Life cicile
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Metric.colorBackround
        setupHerarcy()
        setupView()
        storageManager.makeStorage()
    }
    //MARK: Setup
    private func setupHerarcy() {
        view.addSubview(label)
        view.addSubview(nickNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(proceedButton)
        view.addSubview(imageLogoMDF)
    }
    
    private func setupView(){
        
        imageLogoMDF.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(50)
            make.height.equalTo(Metric.sizeLogoImage)
            make.width.equalTo(Metric.sizeLogoImage)
        }
       
        label.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(60)
            make.width.equalTo(250)
        }
        
        nickNameTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(label).offset(60)
            make.width.equalTo(Metric.widthTextFild)
            make.height.equalTo(Metric.heightView)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(nickNameTextField).offset(60)
            make.width.equalTo(Metric.widthTextFild)
            make.height.equalTo(Metric.heightView)
        }
        
        proceedButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(passwordTextField).offset(60)
            make.width.equalTo(Metric.widthTextFild)
            make.height.equalTo(Metric.heightView)
        }
   }
    //MARK: Actions
    @objc func tapButtonGreteAccount() {
        present(ModuleBuilder.builderRegistrationViewController(), animated: true)
    }
    
    @objc private func tapButtonTabBarController() {
        
        for user in storageManager.items {
            if user.nickName == nickNameTextField.text ?? "" && user.password == passwordTextField.text ?? "" {
                SceneDelegate.shared.changeViewController(viewController: ModuleBuilder.builderTabBarController(),
                                                          animationOptions: .transitionCrossDissolve)
            } else {
// MARK: Alert
                alert.showAlert(title: "Ошибка регистрации или пароля", viewComtroller: self)
            }
        }
    }
}




