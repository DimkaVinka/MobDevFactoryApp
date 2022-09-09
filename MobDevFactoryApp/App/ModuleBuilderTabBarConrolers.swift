//
//  ModuleBuilderTabBarConrolers.swift
//  MobDevFactoryApp
//
//  Created by Daniil Litvinov on 10.08.2022.
//

import UIKit

final class ModuleBuilderTabBarConrolers {
    /// таб бары
    static func buiderLessonViewController() -> UIViewController {
        let viewController = LessonViewController()
        // тут будем model
        return viewController
    }
    
    static func buiderCalendarViewController() -> UIViewController {
//        let viewController = CalendarViewController()
//        // тут будем model
//        return viewController

        let viewController = UIViewController()
        return viewController
    }
    
    static func buiderSearchViewController() -> UIViewController {
        let viewController = SearchViewController()
        // тут будем model
        return viewController
    }
    
    static func buiderPersonViewController() -> UIViewController {
        let viewController = PersonViewController()
        // тут будем model
        return viewController
    }
    
}
