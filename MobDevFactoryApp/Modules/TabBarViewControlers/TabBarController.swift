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
        let first = LessonViewController()
        let firstIcon = UITabBarItem(title: "First", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        first.tabBarItem = firstIcon
        
        let second = SearchViewController()
        let secondItem = UITabBarItem(title: "Second", image: UIImage(systemName: "iphone.homebutton.radiowaves.left.and.right.circle"), selectedImage: UIImage(systemName: "iphone.homebutton.radiowaves.left.and.right.circle.fill"))
        second.tabBarItem = secondItem
        
        let third = CalendarViewModel()
        let thirdIcon = UITabBarItem(title: "Third", image: UIImage(systemName: "homepodmini.2"), selectedImage: UIImage(systemName: "homepodmini.2.fill"))
        third.tabBarItem = thirdIcon
        
        let fourth = PersonViewController()
        let fourtIcon = UITabBarItem(title: "Fourth", image: UIImage(systemName: "camera.macro.circle"), selectedImage: UIImage(systemName: "camera.macro.circle.fill"))
        fourth.tabBarItem = fourtIcon
        
        let controllers = [first, second, third, fourth]
        self.setViewControllers(controllers, animated: true)
    }
}
