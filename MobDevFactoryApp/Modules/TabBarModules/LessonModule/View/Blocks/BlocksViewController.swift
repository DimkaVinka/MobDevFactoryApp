//
//  BlocksViewController.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 30.09.2022.
//

import UIKit

class BlocksViewController: UIViewController {
    
    // MARK: - Properties
    var blocksViewModel: BlocksViewModel?
    
    // MARK: - Lifecycle
    override func loadView() {
        view = blocksViewModel?.view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        blocksViewModel?.loadBlocks()
    }
    
    // MARK: - Setup functions
    private func setupView() {
        title = "Конспекты"
        blocksViewModel?.view.tableView.dataSource = self
        blocksViewModel?.view.tableView.delegate = self
        blocksViewModel?.view.tableView.keyboardDismissMode = .onDrag
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .white
    }
}

// MARK: - Extension: UITableViewDataSource
extension BlocksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blocksViewModel?.blocks.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = blocksViewModel?.blocks[indexPath.row]
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
        let destinationBlock = (blocksViewModel?.blocks[indexPath.row])!
        let destinationController = LessonsViewController()
        destinationController.lessonsViewModel?.block = destinationBlock
        navigationController?.pushViewController(destinationController, animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
