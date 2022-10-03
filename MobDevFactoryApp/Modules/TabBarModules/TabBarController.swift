//
//  ViewController.swift
//  MobDevFactoryApp
//
//  Created by Дмитрий Виноградов on 02.09.2022.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBarController()
        setupTabBarViewControllers()
    }
    
    func setupTabBarController() {
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        view.backgroundColor = .systemGreen
    }
    
    func setupTabBarViewControllers() {
        let first = UINavigationController(rootViewController: BlocksViewController())
        let firstIcon = UITabBarItem(title: "Уроки", image: UIImage(systemName: "house.circle"), selectedImage: UIImage(systemName: "house.circle.fill"))
        first.tabBarItem = firstIcon
        
        let second = SearchViewController()
        let secondItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass.circle"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        second.tabBarItem = secondItem
        
        let third = CalendarViewModel()
        let thirdIcon = UITabBarItem(title: "Календарь", image: UIImage(systemName: "calendar.circle"), selectedImage: UIImage(systemName: "calendar.circle.fill"))
        third.tabBarItem = thirdIcon
        
        let fourth = PersonViewController()
        let fourtIcon = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle.fill"))
        fourth.tabBarItem = fourtIcon
        
        let fifth = SettingsViewController()
        let fifthIcon = UITabBarItem(title: "Настройки", image: UIImage(systemName: "gear.circle"), selectedImage: UIImage(systemName: "gear.circle.fill"))
        fifth.tabBarItem = fifthIcon
        
        let controllers = [first, second, third, fourth, fifth]
        self.setViewControllers(controllers, animated: true)
    }
}
