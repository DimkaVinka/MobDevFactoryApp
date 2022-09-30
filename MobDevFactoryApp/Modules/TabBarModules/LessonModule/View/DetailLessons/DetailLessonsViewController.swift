//
//  DetailLessonsViewController.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 30.09.2022.
//

import UIKit
import WebKit

class DetailLessonsViewController: UIViewController {
    
    // MARK: - Properties
    var detailLessonsViewModel: DetailLessonsViewModel?
    
    // MARK: - Lifecycle
    override func loadView() {
        view = detailLessonsViewModel?.view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        detailLessonsViewModel?.featchHTML(link: detailLessonsViewModel?.link ?? "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(bookmarked))
    }
    
    @objc func bookmarked() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark.fill"), style: .plain, target: self, action: #selector(unBookmarked))
    }
    
    @objc func unBookmarked() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(bookmarked))
    }
    // MARK: - Setup functions
    
    private func setupView() {
        title = detailLessonsViewModel?.courceName
    }
}
