//
//  DetailLessonsViewController.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 30.09.2022.
//

import UIKit
import WebKit
import Combine
import SnapKit

class DetailLessonsViewController: UIViewController {
    
    // MARK: - Properties
    
    var cource: Cource?
    var webView = WKWebView()
    var detailLessonsViewModel = DetailLessonsViewModel()
    let storageManager = CourcesStorageManager()
    var cancellables = Set<AnyCancellable>()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupView()
        
        storageManager.makeStorage()
        
        featchHTML()
        
        detailLessonsViewModel.$cource.sink { [weak self] cource in
            DispatchQueue.main.async {
                self?.cource = cource
            }
        }.store(in: &cancellables)
    }
    
    func featchHTML() {
        
        guard let filePath = Bundle.main.url(forResource: cource?.cource_link, withExtension: "html")
        else {
            print ("File reading error")
            return
        }
        self.webView.loadFileURL(filePath, allowingReadAccessTo: filePath)
    }
    
    @objc func bookmarked() {
        if storageManager.items.count == 0 {
            let favoriteCource = FavoriteCource()
            favoriteCource.cource_name = cource?.cource_name ?? ""
            favoriteCource.cource_link = cource?.cource_link ?? ""
            storageManager.addCource(favoriteCource)
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark.fill"), style: .plain, target: nil, action: nil)
            alert(title: "Урок добавлен в избранное")
            
        } else {
            for item in storageManager.items {
                if item.cource_name == cource?.cource_name && item.cource_link == cource?.cource_link {
                    
                    storageManager.deleteCource(item)
                    alert(title: "Урок удален из избранного")
                    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: nil, action: nil)
                } else {
                    let favoriteCource = FavoriteCource()
                    favoriteCource.cource_name = cource?.cource_name ?? ""
                    favoriteCource.cource_link = cource?.cource_link ?? ""
                    storageManager.addCource(favoriteCource)
                    alert(title: "Урок добавлен в избранное")
                    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark.fill"), style: .plain, target: nil, action: nil)
                }
            }
        }
    }
    
    // MARK: - Setup functions
    
    private func setupView() {
        title = cource?.cource_name
        view.backgroundColor = Metric.colorBackround
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 15 / 255, green: 20 / 255, blue: 59 / 255, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        webView.tintColor = .black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(bookmarked))
    }
    
    private func setupHierarchy() {
        view.addSubview(webView)
    }
    
    private func setupLayout() {
        webView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
}

extension DetailLessonsViewController {
    func alert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(alertButton)
        present(alert, animated: true, completion: nil)
    }
}

