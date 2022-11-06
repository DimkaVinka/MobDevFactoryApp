//
//  CalendarViewModel.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 09.09.2022.
//

import UIKit
import FSCalendar
import SnapKit
import RealmSwift


class CalendarViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel = CalendarViewModel()
    
    private var calendarView: CalendarView? {
        guard isViewLoaded else { return nil }
        return view as? CalendarView
    }
    
    private var model = [EventModel]()
    
    private var selectedDate = Date()
    
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
    
    @objc func controlDidChanged(_ segmentControl: UISegmentedControl) {
        if segmentControl.selectedSegmentIndex == 1 {
            calendarView?.calendar.setScope(.week, animated: calendarView?.toggle.isOn ?? true)
        } else if segmentControl.selectedSegmentIndex == 0 {
            calendarView?.calendar.setScope(.month, animated: calendarView?.toggle.isOn ?? true)
        }
    }
}

    // MARK: - FSCalendarDelegate

extension CalendarViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date.convertToString())
        selectedDate = date
        calendarView?.tableView.reloadData()
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, borderDefaultColorFor date: Date) -> UIColor? {
        for event in EventsList().events {
            if Calendar.current.isDate(event.date, inSameDayAs: date) {
                    return UIColor.systemOrange
            }
        }
        return nil
    }
}

    // MARK: - FSCalendarDelegateAppearance
    
extension CalendarViewController: FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarView?.remakeCalendarConstraints(bounds: bounds)
    }
}

    // MARK: - UITableViewDataSource

extension CalendarViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.eventsForDate(date: selectedDate).count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = viewModel.eventsForDate(date: selectedDate)[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CalendarTableViewCell.identifier, for: indexPath) as! CalendarTableViewCell
         cell.titleLable.text = event.name
         cell.timeLable.text = (event.date).convertToString()
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
}

