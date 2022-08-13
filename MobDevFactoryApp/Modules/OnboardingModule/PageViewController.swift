//
//  PageViewController.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 13.08.2022.
//

import UIKit
import SnapKit

class PageViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    var pageControlBottomAnchor: NSLayoutConstraint?
    let initialPage = 0
    
    lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Далее", for: .normal)
        nextButton.backgroundColor = .systemGreen
        nextButton.layer.cornerRadius = 10
        nextButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        nextButton.addTarget(self, action: #selector(nextTapped(_:)), for: .primaryActionTriggered)
        return nextButton
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        return pageControl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    
    func setup() {
        dataSource = self
        delegate = self
        
        
        let page1 = OnboardingViewController(imageName: "hiImage",
                                             titleText: "Приветствуем тебя",
                                             subtitleText: "в MobDevFactoryApp!")
        let page2 = OnboardingViewController(imageName: "mobile-dev",
                                             titleText: "",
                                             subtitleText: "Это приложение школы мобильной разработки MobDevFactory, которое поможет тебе учиться более комфортно и эффективно!")
        let page3 = OnboardingViewController(imageName: "readingImage",
                                             titleText: "Читай конспекты",
                                             subtitleText: "Ты можешь изучать или повторять темы конспектов в любое время со своего телефона, онлайн или офлайн.")
        let page4 = OnboardingViewController(imageName: "calendarImage",
                                             titleText: "Следи за расписанием",
                                             subtitleText: "Просматривай расписание своего потока и получай уведомления о новых событиях.")
        let page5 = OnboardingViewController(imageName: "progressImage",
                                             titleText: "Отслеживай прогресс",
                                             subtitleText: "Следи за своим персональным рейтингом и рейтингом своей команды.")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)
        pages.append(page5)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }
    
    func layout() {
        
        view.backgroundColor = UIColor(named: "mainBackgroundColor")
        
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        
        
        pageControl.snp.makeConstraints { (make) in
            make.width.equalTo(view)
            make.height.equalTo(20)
            make.centerX.equalTo(view)
        }
        
        nextButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view).offset(-130)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
            make.height.equalTo(50)
        }
        
        pageControlBottomAnchor = view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 4)
        pageControlBottomAnchor?.isActive = true
        
    }
}

// MARK: - DataSource
extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return pages.first
        }
    }
    
    
}

// MARK: - Delegates
extension PageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
    }
}

// MARK: - Actions
extension PageViewController {
    
    @objc func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
    
    @objc func skipTapped(_ sender: UIButton) {
        let lastPageIndex = pages.count - 1
        pageControl.currentPage = lastPageIndex
        goToSpecificPage(index: lastPageIndex, ofViewControllers: pages)
    }
    
    @objc func nextTapped(_ sender: UIButton) {
        pageControl.currentPage += 1
        goToNextPage()
    }
}

// MARK: - Extensions
extension PageViewController {
    
    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
        
        setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let prevPage = dataSource?.pageViewController(self, viewControllerBefore: currentPage) else { return }
        
        setViewControllers([prevPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToSpecificPage(index: Int, ofViewControllers pages: [UIViewController]) {
        setViewControllers([pages[index]], direction: .forward, animated: true, completion: nil)
    }
}
