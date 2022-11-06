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
        let viewController = BlocksViewController()
        return viewController
    }
    
    static func buiderSearchViewController() -> UIViewController {
        let viewController = SearchViewController()
        return viewController
    }
    
    static func buiderCalendarViewController() -> UIViewController {
        let viewController = CalendarViewController()
        return viewController
    }
    
    static func buiderRatingViewController() -> UIViewController {
        let viewController = RatingViewController()
        return viewController
    }
    
    static func buiderSettingsViewController() -> UIViewController {
        let viewController = SettingsViewController()
        return viewController
    }
    
}
