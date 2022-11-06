//
//  BlocksViewController.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 30.09.2022.
//

import UIKit
import Combine
import RealmSwift

class BlocksViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel = BlocksViewModel()
    private var observer: AnyCancellable?
    var blocks: [Block]?
    
    private var currentView: BlocksView? {
        guard isViewLoaded else { return nil }
        return view as? BlocksView
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = BlocksView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadBlocks()
        observer = viewModel.$blocks.sink { block in
            self.blocks = block
        }
        setupView()
    }
    
    // MARK: - Setup functions
    private func setupView() {
        title = "Конспекты"
        
        currentView?.tableView.dataSource = self
        currentView?.tableView.delegate = self
        currentView?.tableView.keyboardDismissMode = .onDrag
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
}

// MARK: - Extension: UITableViewDataSource
extension BlocksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blocks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Subtitle2")
        let info = blocks?[indexPath.row]
        cell.textLabel?.text = info?.block_name
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(systemName: "arrow.right.circle.fill")
        return cell
    }
}

// MARK: - Extension: UITableViewDelegate
extension BlocksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destinationBlock = blocks?[indexPath.row]
        let destinationController = LessonsViewController()
        navigationController?.pushViewController(destinationController, animated: true)
        destinationController.viewModel.block = destinationBlock
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
