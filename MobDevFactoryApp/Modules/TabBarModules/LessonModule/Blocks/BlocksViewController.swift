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
    var blocksViewModel = BlocksViewModel()
    private var observer: AnyCancellable?
    var blocks: Results<RealmBlock>?
    
    //let storageManager = CourcesStorageManager()
    
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
        //storageManager.makeStorage()
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
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 15 / 255, green: 20 / 255, blue: 59 / 255, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        currentView?.segmentControl.addTarget(self, action: #selector(controlDidChanged(_:)), for: .valueChanged)
    }
    
    @objc func controlDidChanged(_ segmentControl: UISegmentedControl) {
        currentView?.tableView.reloadData()
    }
}

// MARK: - Extension: UITableViewDataSource
extension BlocksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var result = 0
        
        let segmentControlIndex = currentView?.segmentControl.selectedSegmentIndex
        
        if segmentControlIndex == 0 {
            result = blocks?.count ?? 0
        } else {
            //if storageManager.items?.count == 0 {
                result = 1
           // } else {
                //result = storageManager.items?.count ?? 0
            //}
        //}
    }
        return result
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Subtitle2")
//        let segmentControlIndex = currentView?.segmentControl.selectedSegmentIndex
        
//        if segmentControlIndex == 0 {
        let info = blocks?[indexPath.row]
        cell.textLabel?.text = info?.block_name
            cell.accessoryType = .disclosureIndicator
            cell.imageView?.image = UIImage(systemName: "arrow.right.circle.fill")
//        } else {
//            if storageManager.items?.count == 0 {
//                cell.textLabel?.text = "Нет элементов в избранном"
//            } else {
//                let favoriteCources = storageManager.items?[indexPath.row]
//                cell.textLabel?.text = favoriteCources?.cource_name
//                cell.accessoryType = .disclosureIndicator
//                cell.imageView?.image = UIImage(systemName: "arrow.right.circle.fill")
//            }
        //}
        return cell
    }
}

// MARK: - Extension: UITableViewDelegate
extension BlocksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destinationBlock = blocks?[indexPath.row]
        
        let segmentControlIndex = currentView?.segmentControl.selectedSegmentIndex
        
        if segmentControlIndex == 0 {
            let destinationController = LessonsViewController()
            navigationController?.pushViewController(destinationController, animated: true)
            destinationController.lessonsViewModel.block = destinationBlock
            tableView.deselectRow(at: indexPath, animated: false)
        } else {
//            let favoriteCources = storageManager.items?[indexPath.row]
//
//            let destinationController = DetailLessonsViewController()
//            destinationController.detailLessonsViewModel.cource = favoriteCources
//            
//            navigationController?.pushViewController(destinationController, animated: true)
//            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}
