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
        self.blocksViewModel.loadBlocks()
        
        observer = blocksViewModel.$blocks.sink { block in
            self.blocks = block
        }
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
        let destinationBlock = (blocks?[indexPath.row])!
        let destinationController = LessonsViewController()
        destinationController.lessonsViewModel.block = destinationBlock
        navigationController?.pushViewController(destinationController, animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
