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
//        view.backgroundColor = .systemGreen
    }
    
    func setupTabBarViewControllers() {
        let first = UINavigationController(rootViewController: BlocksViewController())
        let firstIcon = UITabBarItem(title: "Уроки", image: UIImage(systemName: "book.circle"), selectedImage: UIImage(systemName: "book.circle.fill"))
        first.tabBarItem = firstIcon
        
        let second = SearchViewController()
        let secondItem = UITabBarItem(title: "Словарь", image: UIImage(systemName: "book.closed.circle"), selectedImage: UIImage(systemName: "book.closed.circle.fill"))
        second.tabBarItem = secondItem
        
        let third = CalendarViewModel()
        let thirdIcon = UITabBarItem(title: "Календарь", image: UIImage(systemName: "calendar.circle"), selectedImage: UIImage(systemName: "calendar.circle.fill"))
        third.tabBarItem = thirdIcon

        let fourth = UINavigationController(rootViewController: RatingViewController())
        let fourtIcon = UITabBarItem(title: "Рейтинг", image: UIImage(systemName: "star.circle"), selectedImage: UIImage(systemName: "star.circle.fill"))
        fourth.tabBarItem = fourtIcon
        
        let fifth = UINavigationController(rootViewController: SettingsViewController())
        let fifthIcon = UITabBarItem(title: "Настройки", image: UIImage(systemName: "gear.circle"), selectedImage: UIImage(systemName: "gear.circle.fill"))
        fifth.tabBarItem = fifthIcon
        
        let controllers = [first, second, third, fourth, fifth]
        self.setViewControllers(controllers, animated: true)
    }
}
