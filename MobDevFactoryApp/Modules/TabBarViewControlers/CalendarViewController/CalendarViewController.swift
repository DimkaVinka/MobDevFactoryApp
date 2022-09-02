//
//  CalendarViewController.swift
//  MobDevFactoryApp
//
//  Created by Daniil Litvinov on 10.08.2022.
//

import UIKit
import SnapKit

@available(iOS 16.0, *)
final class CalendarViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var lablesStack: UIStackView = {
        let lablesStack = UIStackView()
        lablesStack.axis = .horizontal
        lablesStack.backgroundColor = .white
        lablesStack.layer.cornerRadius = 20
        lablesStack.translatesAutoresizingMaskIntoConstraints = false
        lablesStack.isHidden = true
        return lablesStack
    }()

    lazy var lable: UILabel = {
        let lable = UILabel()
        lable.text = "Нет событий"
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.textColor = .black
        return lable
    }()
    
    lazy var timeLable: UILabel = {
        let lable = UILabel()
        lable.text = ""
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.textColor = .black
        return lable
    }()

    
    lazy var calendarView: UICalendarView = {
        let calendarView = UICalendarView()
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.calendar = .current
        let localeID = Locale.preferredLanguages.first
        
        calendarView.locale = Locale(identifier: localeID!)
        calendarView.fontDesign = .rounded
        calendarView.layer.cornerRadius = 15
        calendarView.tintColor = .systemOrange
        calendarView.backgroundColor = .white

        return calendarView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup functions
    
    private func setupView() {
        view.backgroundColor = Metric.colorBackround
        calendarView.delegate = self
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
    }
    
    private func setupHierarchy() {
        view.addSubview(calendarView)

        view.addSubview(lablesStack)
        lablesStack.addArrangedSubview(lable)
        lablesStack.addArrangedSubview(timeLable)
    }
    
    private func setupLayout() {
        calendarView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(350)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
        }
        
        lablesStack.snp.makeConstraints { make in
            make.top.equalTo(calendarView.snp.bottom).offset(40)
            make.left.equalTo(view.snp.left).offset(30)
            make.right.equalTo(view.snp.right).offset(-30)
            make.height.equalTo(50)
        }
        
        lable.snp.makeConstraints { make in
            make.left.equalTo(lablesStack.snp.left).offset(10)
        }
        
        timeLable.snp.makeConstraints { make in
            make.left.equalTo(lablesStack.snp.right).offset(-60)
            make.right.equalTo(lablesStack.snp.right).offset(-10)
        }
    }
    
    // MARK: - Functions
}

@available(iOS 16.0, *)
extension CalendarViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {

    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        
        let font = UIFont.systemFont(ofSize: 14)
        let configuration = UIImage.SymbolConfiguration(font: font)
        let image = UIImage(systemName: "phone.circle.fill", withConfiguration: configuration)?.withRenderingMode(.alwaysOriginal)
        
        if dateComponents.day == 2 || dateComponents.day == 9 || dateComponents.day == 14 || dateComponents.day == 23 || dateComponents.day == 30 {
            return UICalendarView.Decoration.image(image)
        }
        return nil
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        lablesStack.isHidden = false
        
        if dateComponents?.day == 2 || dateComponents?.day == 9 || dateComponents?.day == 14 || dateComponents?.day == 23 || dateComponents?.day == 30 {
            lable.text = "Созвон с группой"
            timeLable.text = "19.00"
        } else {
            lable.text = "Нет событий"
            timeLable.text = ""
        }
    }
      
    func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
        return true
    }
}
