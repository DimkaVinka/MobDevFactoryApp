//
//  BlocksViewController.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 30.09.2022.
//

import UIKit
import Combine

class BlocksViewController: UIViewController {
    
    // MARK: - Properties
    var blocksViewModel = BlocksViewModel()
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
        
        blocksViewModel.loadBlocks()
        observer = blocksViewModel.$blocks.sink { block in
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
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .white
    }
}

// MARK: - Extension: UITableViewDataSource
extension BlocksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blocks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = blocks?[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Subtitle2")
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
        let destinationController = LessonsViewController()
        destinationController.lessonsViewModel.block = blocks?[indexPath.row]
        navigationController?.pushViewController(destinationController, animated: true)
    }
}
