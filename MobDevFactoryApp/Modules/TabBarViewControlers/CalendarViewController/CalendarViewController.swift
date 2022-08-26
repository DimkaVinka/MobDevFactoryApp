//
//  CalendarViewController.swift
//  MobDevFactoryApp
//
//  Created by Daniil Litvinov on 10.08.2022.
//

import UIKit
import SnapKit

final class CalendarViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var calendarView: UICalendarView = {
        let calendarView = UICalendarView()
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.calendar = .current
        calendarView.locale = .current
        calendarView.fontDesign = .rounded
        return calendarView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()

    }
    
    private func setupView() {
        view.backgroundColor = Metric.colorBackround
    }
    private func setupHierarchy() {
        view.addSubview(calendarView)
    }
    
    private func setupLayout() {
        calendarView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(300)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
        }
    }
}
