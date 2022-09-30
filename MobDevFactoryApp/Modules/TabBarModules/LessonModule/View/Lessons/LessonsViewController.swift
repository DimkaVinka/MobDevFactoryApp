//
//  LessonsViewController.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 30.09.2022.
//

import UIKit

class LessonsViewController: UIViewController {
    
    // MARK: - Properties
    var lessonsViewModel = LessonsViewModel()
    
    // MARK: - Lifecycle
    override func loadView() {
        view = lessonsViewModel?.view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup functions
    private func setupView() {
        title = "Список уроков"
        lessonsViewModel?.view.tableView.delegate = self
        lessonsViewModel?.view.tableView.dataSource = self
    }
}

// MARK: - Extension: UITableViewDataSource
extension LessonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessonsViewModel?.cources.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = lessonsViewModel?.cources[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Subtitle2")
        cell.textLabel?.text = info?.cource_name
        cell.detailTextLabel?.text = "Дата открытия: \(String(describing: info?.cource_opening_time ?? ""))"
        cell.accessoryType = .detailButton
        return cell
    }
}
    
// MARK: - Extension: UITableViewDelegate
extension LessonsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationController = DetailLessonsViewController()
        destinationController.detailLessonsViewModel?.cource = (lessonsViewModel?.cources[indexPath.row])!
        navigationController?.pushViewController(destinationController, animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

