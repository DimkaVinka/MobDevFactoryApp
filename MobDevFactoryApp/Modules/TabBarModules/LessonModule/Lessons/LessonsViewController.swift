//
//  LessonsViewController.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 30.09.2022.
//

import UIKit
import Combine

class LessonsViewController: UIViewController {
    
    // MARK: - Properties
    var lessonsViewModel = LessonsViewModel()
    
    var currentView: LessonsView? {
        guard isViewLoaded else { return nil }
        return view as? LessonsView
    }
    
    var block: Block?
    
    private var observer: AnyCancellable?
    
    // MARK: - Lifecycle
    override func loadView() {
        view = LessonsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        observer = lessonsViewModel.$block.sink { block in
            self.block = block
        }
        setupView()
    }
    
    // MARK: - Setup functions
    private func setupView() {
        title = "Список уроков"
        currentView?.tableView.dataSource = self
        currentView?.tableView.delegate = self
        currentView?.tableView.keyboardDismissMode = .onDrag
    }
}

    //MARK: - Extension: UITableViewDataSource
extension LessonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return block?.cource.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = block?.cource[indexPath.row]
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
        destinationController.detailLessonsViewModel.cource = block?.cource[indexPath.row]
        navigationController?.pushViewController(destinationController, animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

