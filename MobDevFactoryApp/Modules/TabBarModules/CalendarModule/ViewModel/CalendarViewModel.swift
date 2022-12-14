//
//  CalendarViewModel.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 09.09.2022.
//

import UIKit
import FSCalendar
import SnapKit


class CalendarViewModel: UIViewController {
    
    // MARK: - Properties
    
    private var calendarView: CalendarView? {
        guard isViewLoaded else { return nil }
        return view as? CalendarView
    }
    
    private var model = [EventModel]()
    
    var selectedDate = Date()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = CalendarView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        calendarView?.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup functions
    
    private func setupView() {
        
        title = "Календарь"

        calendarView?.tableView.dataSource = self
        calendarView?.calendar.delegate = self
        calendarView?.segmentControl.addTarget(self, action: #selector(controlDidChanged(_:)), for: .valueChanged)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 15 / 255, green: 20 / 255, blue: 59 / 255, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // MARK: - Functions
    
    func eventsForDate(date: Date) -> [EventModel]  {
        var daysEvents = [EventModel]()
        for event in EventsList().events {
            if Calendar.current.isDate(event.date, inSameDayAs: date) {
                daysEvents.append(event)
            }
        }
        return daysEvents
    }
    
    @objc func controlDidChanged(_ segmentControl: UISegmentedControl) {
        if calendarView?.segmentControl.selectedSegmentIndex == 1 {
            calendarView?.calendar.setScope(.week, animated: calendarView?.toggle.isOn ?? true)
        } else if calendarView?.segmentControl.selectedSegmentIndex == 0 {
            calendarView?.calendar.setScope(.month, animated: calendarView?.toggle.isOn ?? true)
        }
    }
}

    // MARK: - FSCalendarDelegate

extension CalendarViewModel: FSCalendarDelegate {
    
    public func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date.convertToString())
        selectedDate = date
        calendarView?.tableView.reloadData()
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, borderDefaultColorFor date: Date) -> UIColor? {
        for event in EventsList().events {
            if Calendar.current.isDate(event.date, inSameDayAs: date) {
                switch event.colorGroup {
                case .homeworkDeadline:
                    return UIColor.red
                case .homeworkOpen:
                    return UIColor.systemYellow
                case .newConspect:
                    return UIColor.purple
                case .groupCall:
                    return UIColor.systemOrange
                }
            }
        }
        return nil
    }
}

    // MARK: - FSCalendarDelegateAppearance
    
extension CalendarViewModel: FSCalendarDelegateAppearance {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarView?.remakeCalendarConstraints(bounds: bounds)
    }
}
    
//extension CalendarViewModel: FSCalendarDataSource {
//    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//        var returnValue = UIImage()
//        for event in EventsList().events {
//            if Calendar.current.isDate(event.date, inSameDayAs: date) {
//                switch event.colorGroup {
//                case .groupCall:
//                    returnValue = UIImage(systemName: "circle.dotted")!
//                case .newConspect:
//                    returnValue = UIImage(systemName: "circle.dotted")!
//                case .homeworkOpen:
//                    returnValue = UIImage(systemName: "circle.dotted")!
//                case .homeworkDeadline:
//                    returnValue = UIImage(systemName: "circle.dotted")!
//                }
//            }
//        }
//        return returnValue
//    }
    
    ///Метод для создания цветных иконок
    
//        func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
//    
//            let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
//    
//            for event in EventsList().events {
//                if Calendar.current.isDate(event.date, inSameDayAs: date) {
//                    switch event.colorGroup {
//                    case .homeworkDeadline:
//                        cell.contentView.tintColor = .red
//                    case .homeworkOpen:
//                        cell.contentView.tintColor = .systemBrown
//                    case .newConspect:
//                        cell.contentView.tintColor = .purple
//                    case .groupCall:
//                        cell.contentView.tintColor = .gray
//                    }
//                }
//            }
//            return cell
//        }


    // MARK: - UITableViewDataSource

extension CalendarViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsForDate(date: selectedDate).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = eventsForDate(date: selectedDate)[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CalendarTableViewCell.identifier, for: indexPath) as! CalendarTableViewCell
        cell.titleLable.text = event.name
        cell.noteLable.text = event.description
        cell.timeLable.text = Date().timeString(date: event.date)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        switch event.colorGroup {
        case .groupCall:
            cell.imageView?.image = UIImage(systemName: "phone.badge.plus")
        case .newConspect:
            cell.imageView?.image = UIImage(systemName: "book")!
        case .homeworkOpen:
            cell.imageView?.image = UIImage(systemName: "folder.badge.plus")!
        case .homeworkDeadline:
            cell.imageView?.image = UIImage(systemName: "clock.badge.exclamationmark")!
        }
        return cell
    }
}

