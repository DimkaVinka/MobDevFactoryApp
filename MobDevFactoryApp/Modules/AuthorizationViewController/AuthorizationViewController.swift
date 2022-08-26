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
    private var greteAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Metric.cornelRadiusView
        button.setTitle("Создать аккаунт", for: .normal)
        button.addTarget(self, action: #selector(tapButtonGreteAccount), for: .touchUpInside)
        return button
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
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Metric.cornelRadiusView
        textField.clearButtonMode = .always
        textField.placeholder = "Nick Name"
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
        view.addSubview(greteAccountButton)
        view.addSubview(label)
        view.addSubview(nickNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(proceedButton)
    }
    
    private func setupView(){
        
        greteAccountButton.snp.makeConstraints { make in
            make.right.equalTo(view)
            make.top.equalTo(view).offset(330)
            make.width.equalTo(150)
            make.height.height.equalTo(Metric.heightView)
        }
       
        label.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(30)
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
                let tabBarViewController = UITabBarController()
                tabBarViewController.tabBar.backgroundColor = .white
                let lessonTabBarItem = ModuleBuilderTabBarConrolers.buiderLessonViewController()
                lessonTabBarItem.tabBarItem = UITabBarItem(title: "Уроки", image: UIImage(systemName: "books.vertical.fill"), tag: 0)
                let calendarTabBarItem = ModuleBuilderTabBarConrolers.buiderCalendarViewController()
                calendarTabBarItem.tabBarItem = UITabBarItem(title: "Календарь", image: UIImage(systemName: "calendar"), tag: 1)
                let searchTabbarItem = ModuleBuilderTabBarConrolers.buiderSearchViewController()
                searchTabbarItem.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 2)
//                let personTabbarItem = ModuleBuilderTabBarConrolers.buiderPersonViewController()
//                personTabbarItem.tabBarItem = UITabBarItem(title: "Студент", image: UIImage(systemName: "person"), tag: 3)
                tabBarViewController.setViewControllers([
                    lessonTabBarItem,
                    searchTabbarItem,
                    calendarTabBarItem,
                   // personTabbarItem,
                ], animated: true)
                tabBarViewController.modalPresentationStyle = .fullScreen
                present(tabBarViewController, animated: true)
            } else {
// MARK: Alert
                alert.showAlert(title: "Либо пароль или логин не правильно либо регистроваться надо", viewComtroller: self)
            }
        }
    }
}


